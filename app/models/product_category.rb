class ProductCategory < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :product
	belongs_to :category
end
