require 'pry-nav'
require "rest_client"
require 'Nokogiri'
class Scraper 
	attr_reader :path, :primary_selector, :response, :page, :allstudentlis, :info
	def initialize path 
		@path = "http://#{path}"
		#http://www.eatbydate.com/dairy/ice-cream-shelf-life-expiration-date/
	end
	def fetch
		@response = RestClient.get(@path)
	end
	def parse(selector)
		html = Nokogiri::HTML(@response)
		html.css(selector).map do |element|
			yield element
		end
	end
end
