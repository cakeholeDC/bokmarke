class ApplicationController < ActionController::Base
	helper_method :is_current_profile?

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
end
