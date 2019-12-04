class SessionsController < ApplicationController

	def create
		username = params[:username]
		reader = Reader.find_by(username: username)

		if reader && reader.authenticate(params[:password])
			session[:username] = reader.username
			# cookies[:test] = test
			redirect_to home_path
		else
			flash[:error] = "No such user exists"
			redirect_to login_path
		end
	end

	def logout
		session.clear
		redirect_to login_path
	end

end
