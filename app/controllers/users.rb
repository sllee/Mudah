require 'byebug'

get '/users/:user_id/products' do	
	@user = User.find(params[:user_id])
	# @products=[]
	# @products << Product.find_by(user_id: params[:user_id])
	@products = @user.products.all
	byebug
	erb :"static/users/users_products"
end