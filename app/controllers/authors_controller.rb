class AuthorsController < ApplicationController
	before_action :find_author, only: [:show]

	def index
		@authors = Author.all
	end

	private

		def find_author
			@author = Author.find(params[:id])
		end
end
