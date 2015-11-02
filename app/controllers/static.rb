get '/' do
	if !params[:error_msg].nil?
		@error = params[:error_msg]
	end
  erb :"static/index"
end

post '/signup' do
	user = User.new(params[:user])
	if user.save
		@message = "Signed up. you may now login."
		erb :"static/index"
	else
		@message = "Error signup."
	end
	redirect to "/?error_msg=#{@message}"
end

post '/login' do
	@user = User.authenticate(params[:user][:email],params[:user][:password])
	if @user.nil?
		@error_msg = "Login failed"
		redirect to "/?error_msg=#{@error_msg}"
	else
		session[:user_id] = @user.id
		@products = Product.all

		redirect to "/products"
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