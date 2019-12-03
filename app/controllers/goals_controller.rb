class GoalsController < ApplicationController

	def create
		@goal = Goal.create(goals_params)

		redirect_to reader_path(@goal.reader_id)
	end

	def update_status
		@goal = Goal.find(params[:goal_id])
		@goal.toggle!(:status)
		redirect_to reader_path(@goal.reader)

	end


	private

	def goals_params
		params.require(:goal).permit(:reader_id,:book_id,:status)
	end

end
