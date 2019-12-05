class GoalsController < ApplicationController

	def create
		@goal = Goal.create(goals_params)

		redirect_to book_path(@goal.book_id)
	end

	def update_status
		# byebug
		@goal = Goal.find(params[:id])
		@goal.toggle!(:status)
		redirect_to reader_path(@goal.reader)
	end

	def destroy
		@goal = Goal.find(params[:id])
		reader = @goal.reader
		@goal.destroy
		redirect_to reader_path(reader)
	end

	private

	def goals_params
		params.require(:goal).permit(:reader_id,:book_id,:status)
	end

end
