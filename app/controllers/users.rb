require 'byebug'

get '/users/:user_id/products' do	
	@user = User.find(params[:user_id])
	# @products=[]
	# @products << Product.find_by(user_id: params[:user_id])
	@products = @user.products.all
	byebug
	erb :"static/users/users_products"
end

get '/users/:user_id/favourites' do
	byebug
	@user = User.find(params[:user_id])
	@favourites = @user.favourites.all
	erb :"static/users/users_favourites"
end