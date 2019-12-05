class BooksController < ApplicationController
	before_action :find_book, only: [:show]

	def show
		@goal = Goal.new
		@review = Review.new
	end

	def create


		if params[:search] != ''
			results = GoogleBooks.search("in#{params[:type]}:#{params[:search]}", {:count => 5})
			@books = Book.create_books_from_google(results)
		end
		render :index
	end

	private

		def find_book
			@book = Book.find(params[:id])
		end
end
