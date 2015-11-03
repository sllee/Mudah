require 'byebug'

get '/users/:user_id/favourites' do
	@user = User.find(params[:user_id])
	@favourites = @user.favourites.all
	erb :"static/users/users_favourites"
end

delete '/favourites/:id' do
	favourite = Favourite.find(params[:p_id])

	if favourite.user == current_user
			favourite.destroy
		# Favourite.find(params[:id]).destroy
		redirect to "/users/#{current_user.id}/favourites"
	else

	end
end

post '/user/:user_id/favourites/:p_id' do
	
	user = User.find(params[:user_id])
	product = Product.find(params[:p_id])
	favourite_exist = product.favourites.where(user_id: user.id)

	if favourite_exist
		redirect "/products"
	else
		@favourite = Favourite.new(user_id: user.id, product_id: product.id)
		@favourite.save
		redirect "/products"
	end
end

get '/products/:p_id/products_favourites' do
	@product = Product.find(params[:p_id])
	@favourites = @product.favourites
	erb :"static/favourites/products_favourites"
end

