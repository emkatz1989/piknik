class StreamsController < ApplicationController

	def new
		@stream = Stream.new
		@streams = Stream.all
	end

	def index
		@streams = Stream.all
	end

	def update
		@stream = Stream.find(params[:id])
		if @stream.update_attributes(stream_params)
		redirect_to streams_path
		else
		render 'edit'
		end
	end

	def create
		@stream = Stream.new(stream_params)
		if @stream.save
			redirect_to :back
		else
			render 'index'
		end
	end

	def destroy
		@stream = Stream.find(params[:id])
		@stream.destroy
		redirect_to :back
	end
	private

	def stream_params
		params.require(:stream).permit(:user_id, :name, :description, :image)
	end
end