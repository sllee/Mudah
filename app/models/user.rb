class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :products, dependent: :destroy
	has_many :favourites, dependent: :destroy
end
