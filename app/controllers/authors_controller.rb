class AuthorsController < ApplicationController
	before_action :find_author, only: [:show]

	def index
		if Author.search(params[:search]) == []
			flash[:error] = "No Results Found"
			@authors = Author.all
		else
			@authors = Author.search(params[:search])
		end
	end

	private

		def find_author
			@author = Author.find(params[:id])
		end
end
