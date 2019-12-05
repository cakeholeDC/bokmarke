class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def create

		@review = Review.create(review_params)

		# if @review.save
		# 	redirect_to books_path#(@review.book)
		# else
		# 	redirect_to book_path#(@review.book)
		# end

		redirect_to book_path(@review.book_id)
	end

	private

	def review_params
		params.require(:review).permit(:content, :book_id, :goal_id, :rating, :recommend)

	end
end
