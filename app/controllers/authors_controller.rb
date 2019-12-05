class AuthorsController < ApplicationController
	before_action :find_author, only: [:show]

	def index
		if Author.search(params[:search]) == []
			flash[:error] = "No Results Found"
			@authors = Author.all.sort_by {|author| author.name}
		else
			@authors = Author.search(params[:search]).sort_by {|author| author.name}
		end
	end

	private

		def find_author
			@author = Author.find(params[:id])
		end
end

