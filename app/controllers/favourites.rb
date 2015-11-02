require 'byebug'

delete '/favourites/:id' do
	Favourite.find(params[:id]).destroy
	redirect to '/users/#{current_user.id}/favourites'
end

post '/user/:user_id/favourites/:p_id' do
	byebug
	user = User.find(params[:user_id])
	product = Product.find(params[:p_id])
	@favourite = user.favourites.new(product: product.product_name)	

	if @favourite.save
		byebug
		redirect "/products"
	end
end