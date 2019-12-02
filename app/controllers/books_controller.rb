class BooksController < ApplicationController
	before_action :find_book, only: [:show]
	
	def index
		@books = Book.all
	end

	private

		def find_book
			@book = Book.find(params[:id])
		end
end
