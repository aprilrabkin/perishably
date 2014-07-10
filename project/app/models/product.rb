class Product < ActiveRecord::Base
	validates :name, :presence_of
	validates :expirationdate, :presence_of
end