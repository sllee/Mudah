require 'byebug'

get '/products' do
	@products = Product.all
	erb :"static/products/products_index"
end

get '/products/new' do
	if !params[:error_msg].nil?
		@error = params[:error_msg]
	end
	erb :"static/products/products_new"
end

post '/products' do
	# if params[:prodcut].nil?
		# user = User.find(current_user.id)
	product = current_user.products.new(params[:product])
	if product.save
		redirect to "/users/#{current_user.id}/products"
	else
		@error_msg = "something is wrong"
		redirect "/products/new?error_msg=#{@error_msg}"
	end

end

get '/products/:p_id' do
	@products = Product.find(params[:p_id])
	byebug
	erb :"static/products/products_show"
end

get '/products/:p_id/edit' do
	@product = Product.find(params[:p_id])

	if @product.user == current_user
		erb :"static/products/products_edit"
	else
		redirect "/products"
	end
end

put '/products/:id' do
	product = Product.find(params[:id])
	product.product_name = params[:product][:name]
	product.price = params[:product][:price]
	product.save
	redirect to "/users/#{current_user.id}/products"

end

delete '/products/:id' do
	@product = Product.find(params[:p_id])

	if @product.user == current_user
		@product.destroy
	end
	# Product.find(params[:id]).destroy
		redirect to '/products'
end

get '/users/:user_id/products' do	
	@user = User.find(params[:user_id])
	# @products=[]
	# @products << Product.find_by(user_id: params[:user_id])
	@products = @user.products.all
	erb :"static/users/users_products"
end


