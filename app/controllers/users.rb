require 'byebug'

# get '/users/:user_id/products' do	
# 	@user = User.find(params[:user_id])
# 	# @products=[]
# 	# @products << Product.find_by(user_id: params[:user_id])
# 	@products = @user.products.all
# 	erb :"static/users/users_products"
# end

# get '/users/:user_id/favourites' do
# 	@user = User.find(params[:user_id])
# 	@favourites = @user.favourites.all
# 	erb :"static/users/users_favourites"
# end

post '/signup' do
	user = User.new(params[:user])
	if user.save
		@message = "Signed up. you may now login."
		erb :"static/index"
	else
		@message = "Error signup."
		redirect to "/?error_msg=#{@message}"
	end
	
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if @user
		session[:user_id] = @user.id
		@products = Product.all

		redirect to "/products"
	else
		@error_msg = "Login failed"
		redirect to "/?error_msg=#{@error_msg}"
		
	end
end

post '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :"static/users/users_profile"
end

