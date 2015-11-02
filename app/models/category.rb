class Category < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  has_many :products, through: :productscategories, dependent: :destroy
end
