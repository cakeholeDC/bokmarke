class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def create
		byebug
		@review = Review.new

		if @review.save
			redirect_to book_path(@review.book)
		else
			render :new
		end
	end
end
