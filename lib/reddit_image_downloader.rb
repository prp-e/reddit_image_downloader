require 'json'
require 'httparty'
require 'digest'

class RedditImage
	def initialize(sub, qty=25, directory="images")
		@sub = sub
		@qty = qty
		@directory = directory
	end

	def get_info
		puts "Going to crawl: "
		puts "https://reddit.com/r/#{@sub}"
	end

	def download_images
		response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
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

		links.each do |link| 
			if link != nil
				file_name = "#{Digest::MD5.hexdigest(link)}.jpg"
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
