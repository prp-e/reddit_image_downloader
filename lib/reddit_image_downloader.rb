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
		response = HTTParty.get("https://reddit.com/r/#{@sub}.json?limit=#{@qty}")
		return response.body 
	end
end
