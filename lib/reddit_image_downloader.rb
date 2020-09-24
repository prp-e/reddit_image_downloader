require 'json'
require 'http'

class RedditImage
	def initialize(sub, qty)
		@sub = sub
		@qty = qty
	end
end
