class BooksController < ApplicationController
	before_action :find_book, only: [:show]

	def show
		@goal = Goal.new
		@review = Review.new
	end

	def create
		results = GoogleBooks.search(params[:search], {:count => 5})
		@books = Book.create_books_from_google(results)
		# byebug
		render :index
	end

	private

		def find_book
			@book = Book.find(params[:id])
		end
end
