
helpers do
#this will return the current user, if they axist
#Replace with code that works with your application
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end	

	#returns true if current_user exist, false otherwise
	def logged_in?
		!current_user.nil?
	end
end