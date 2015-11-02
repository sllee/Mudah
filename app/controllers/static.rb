get '/' do
	if !params[:error_msg].nil?
		@error = params[:error_msg]
	end
  erb :"static/index"
end