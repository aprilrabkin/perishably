require_relative 'scraper'
class EatByDate < Scraper
	lasagna_array = []
	scraper = Scraper.new("www.eatbydate.com/grains/lasagna/")
	noko = scraper.fetch
	tablenoko = noko.css('#unopened')
	#pick out the second th--this will be default pantry/fridge/freezer
	#then take each tr and 
	#find what's in strong = that's the product name
	#find the second column = that's the time
	products = []
	storage_default = tablenoko.css('th')[1].text
	tablenoko.css('tr').each do |tr| 
		unless tr.css('td')[0] == nil || tr.css('td')[0].text == ""
			product = {}
			product["name"] = tr.css('strong').text
			product["time"] = tr.css('td')[1].text
			product["storage"] = storage_default
			products << product
		end
	end
					binding.pry

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
