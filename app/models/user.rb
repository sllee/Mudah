class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :products, dependent: :destroy
	has_many :favourites, dependent: :destroy

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :password

	def self.authenticate(email,password)
		if User.exists?(:email => email) 
			@user = User.find_by(:email=>email)
			if @user && password == @user.password
				@user
			else
				nil
			end
		else
			nil
		end
	end
	
end
