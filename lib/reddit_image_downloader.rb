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
			links << datum['url_overridden_by_dest']
		end

		download_list = File.open("downloads_list.txt", "w")
		links.each do |link| 
			download_list.write(link + "\n")
		end 

		Dir::chdir("..")

		return links
	end
end
