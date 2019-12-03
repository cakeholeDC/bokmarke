class GoalsController < ApplicationController

	def create
		@goal = Goal.create(goals_params)

		redirect_to reader_path(@goal.reader_id)
	end


	private

	def goals_params
		params.require(:goal).permit(:reader_id,:book_id,:status)
	end

end
