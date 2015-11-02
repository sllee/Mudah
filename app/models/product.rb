class Product < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	# has_many :categories, through: :productscategories, dependent: :destroy
end
