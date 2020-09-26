require 'json'
require 'httparty'
require 'digest'

class RedditImage
	def initialize(sub, qty=25, directory="images", endpoint=nil, after_pointer=nil)
		@sub = sub
		@qty = qty
		@directory = directory
		@endpoint = endpoint 
		@after_pointer = after_pointer
		@after_pointer_temporary = nil 
		@index = 0
	end

	def get_info
		puts "Going to crawl: "
		puts "https://reddit.com/r/#{@sub}"

		if @endpoint == nil
			if @after_pointer == nil
				response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
			else 
				response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}&after=#{@after_pointer}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
			end 
		else 
			if @after_pointer == nil 
				response = HTTParty.get("https://reddit.com/r/#{@sub}/#{@endpoint}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
			else 
				response = HTTParty.get("https://reddit.com/r/#{@sub}/#{@endpoint}.json?limit=#{@qty}&after=#{@after_pointer}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
			end
		end

		after_pointer = JSON.parse(response.body)
		after_pointer = after_pointer['data']['after']

		puts "The value of \"after\" pointer is: #{after_pointer}"
		@after_pointer_temporary = after_pointer
	end

	def update_data
		@after_pointer = @after_pointer_temporary
		@index = @index + 1
		@directory = @directory + @index.to_s 
	end 

	def download_images
		if @endpoint == nil
			response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
		else 
			response = HTTParty.get("https://reddit.com/r/#{@sub}/#{@endpoint}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
		end 
		json_response = JSON.parse(response.body)
		data = json_response['data']['children'] 
			
		Dir::mkdir("#{@directory}")
		Dir::chdir("#{@directory}")

		links = []
		data.each do |datum|
			datum = datum['data']
			if datum['post_hint'] == "image"
				links << datum['url_overridden_by_dest']
			end 
		end

		file_name_base = 1

		links.each do |link| 
			if link != nil
				file_name = "#{file_name_base}"
				final_image = File.open(file_name, "wb")
				final_image.write(HTTParty.get(link))
				puts "Wrote on #{file_name}"
				sleep 0.5
				final_image.close 
			end 
		end 

		Dir::chdir("..")

		return links
	end
end
