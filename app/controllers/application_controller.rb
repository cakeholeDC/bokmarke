class ApplicationController < ActionController::Base
	helper_method :is_current_profile?, :is_logged_in?, :session_user

	def home
		render :home
	end

	def login_required
		if !session.include?(:username)
			flash[:error] = "This page requires an account"
			redirect_to login_path
		end
	end

	def is_current_profile?
		session[:username] == @reader.username
	end

	def is_logged_in?
		session.include?(:username)
	end

	def session_user
		Reader.find_by(username: session[:username]) #unless !session[:username]
	end
end
