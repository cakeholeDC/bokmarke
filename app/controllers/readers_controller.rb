class ReadersController < ApplicationController
	before_action :find_reader, only: [:show, :edit, :update, :destroy]

	def index
		@readers = Reader.all 
	end

	def show
		@goal = Goal.new
	end

	def new
		@reader = Reader.new
	end

	def create
		@reader = Reader.new(reader_params)
		
		if @reader.save
			redirect_to reader_path(@reader)
		else
			render :new
		end
	end

	def update
		@reader.update(reader_params)
		if @reader.valid?
			redirect_to reader_path(@reader)
		else
			render :edit
		end
	end

	def destroy
		@reader.destroy
		redirect_to readers_path
	end

	private

		def find_reader
			@reader = Reader.find(params[:id])
		end

		def reader_params
			params.require(:reader).permit(:name, :bio, :age, :fav_author, :fav_book, :username)
		end
end
