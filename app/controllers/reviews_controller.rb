class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def create

		@review = Review.new(review_params)

		if @review.save
			redirect_to book_path(@review.book)
		else
			@book = Book.find(@review.book_id)
			render "books/show"
		end
	end

	private

	def review_params
		params.require(:review).permit(:content, :book_id, :goal_id, :rating, :recommend)

	end
end
