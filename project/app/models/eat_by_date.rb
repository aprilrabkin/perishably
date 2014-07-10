require_relative 'scraper'
class EatByDate < Scraper
lasagna_array = []
scraper = Scraper.new("www.eatbydate.com/proteins/meats/bacon-shelf-life-expiration-date/")
scraper.fetch
key0 = scraper.parse('td strong') do |r| r.text.gsub("lasts", "") end
tr = scraper.parse('td') do |r| r.text end
print tr
end

# lasagna_array = [ "Deli Lasagna" => { # html.css('td strong')
# 	"refrigerator" => "5-7 days", # html.css('th')[0]	 and html.css('td')[0]
# 	"freezer" => "6-8 months" #html.css('th')[1] and html.css('td')[1]
# 	},
# 	"frozen lasagna" => { # html.css('td strong')[1]
# 		"refrigeratro"=> "5-7 days", #html.css('th')[0] and html.css('td')[3]
# 		"freezer" => "6-8 months"  #html.css('th')[1] and html.css('td')[4]
# 	}
# ]
# lasagna_array[0]['refrigeratro']="5-7days"

# key1 = scraper.universalparse('td strong')[1] do |r| r.text.gsub("lasts", "") end 
# key3 = scraper.universalparse('td strong')[2] do |r| r.text.gsub("lasts", "") end 
# keya = scraper.universalparse('th')[1] do |r| r.text end 
# keyb = scraper.universalparse('th')[2] do |r| r.text end 
# value0 = scraper.universalparse('td')[0] do |r| r.text end
# value1 = scraper.universalparse('td')[1] do |r| r.text end
# value2 = scraper.universalparse('td')[2] do |r| r.text end
