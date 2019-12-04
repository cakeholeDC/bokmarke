class ReadersController < ApplicationController
	before_action :find_reader, only: [:show, :edit, :update, :destroy]
	before_action :login_required, only: [:index, :show, :edit, :update, :destroy]

	def index
		if Reader.search(params[:search]) == []
			flash[:error] = "No Results Found"
			@readers = Reader.all
		else
			@readers = Reader.search(params[:search])
		end
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
			session[:username] = @reader.username
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
			params.require(:reader).permit(:name, :bio, :age, :fav_author, :fav_book, :username, :password)
		end
end
