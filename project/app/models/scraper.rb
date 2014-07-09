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
		html.css(selector).each do |element|
			yield element
		end
	end
end

scraper=Scraper.new("www.eatbydate.com/proteins/meats/bacon-shelf-life-expiration-date/")
scraper.fetch
info = scraper.parse('tr') do |r| print r.text end 
binding.pry
#attributes: 
#opened boolean. default true
#refrigerator, freezer, pantry, defaults to fridge
#Expiration date for each of them. 
#also bacon bits/cooked/fresh