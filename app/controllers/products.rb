require 'byebug'

get '/products' do
	@products = Product.all
	erb :"static/products/products_index"
end

get '/products/new' do
	erb :"static/products/products_new"
end

post '/products' do
	byebug
	# if params[:prodcut].nil?
		user = User.find(current_user.id)
		product = user.products.new(product_name: params[:product])
		byebug
		if product.save
			byebug
		# redirect to "/users/#{user.id}"
			redirect to "/users/#{current_user.id}/products"
		end
	# else
	# 	# @error ="Invalid input, pls try again"
	# 	# redirect to "questions/new/?error_msg=#{@error}"
	# 	# redirect to "/?error_msg=#{@message}"
	# 	redirect to "/products"
	# end
end

# get '/producs/:p_id' do
# 	@products = Product.find(params[:p_id])
# 	@answers = @products.answers.all
# 	erb :"questions/question_show"
# end

get '/products/:p_id/edit' do
	byebug
	@product = Product.find(params[:p_id])
	erb :"static/products/products_edit"
end

put '/products/:id' do
	byebug
	@product = Product.find(params[:id])
	@product.product_name = params[:product][:name]
	@product.save
		redirect to "/users/#{current_user.id}/products"

end

delete '/products/:id' do
	byebug
	Question.find(params[:id]).destroy
	redirect to '/questions'
end