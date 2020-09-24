require 'json'
require 'httparty'

class RedditImage
	def initialize(sub, qty=25)
		@sub = sub
		@qty = qty
	end

	def get_info
		puts "Going to crawl: "
		puts "https://reddit.com/r/#{@sub}"
	end

	def download_images
		response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}", headers: {"User-agent" => "Reddit Image Downloader 1.0"})
		json_response = JSON.parse(response.body)
		data = json_response['data']['children']
		links = [] 
		return json_response
	end
end
