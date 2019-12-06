class ReviewsController < ApplicationController
	before_action :find_review, only: [:edit, :update]

	def new
		@review = Review.new
	end

	def create

		@review = Review.new(review_params)

		if @review.save
			redirect_to book_path(@review.book)
		else
			@book = Book.find(@review.book_id)
			render "books/show" #+ "#review"
		end
	end

	def update
		@review.assign_attributes(review_params)

		if @review.save
			redirect_to book_path(@review.book_id)		
		else
			render :edit
		end
	end

	private

	def review_params
		params.require(:review).permit(:content, :book_id, :goal_id, :rating, :recommend)
	end

	def find_review
		@review = Review.find(params[:id])
	end
end
