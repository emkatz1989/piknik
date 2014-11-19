class StreamsController < ApplicationController

	def index
		@stream = Stream.new
		@users = User.all
		@streams = Stream.all
	end

	def update
		@stream = Stream.find(params[:id])
		if @stream.update_attributes(params.require(:stream).permit(:user_id, :name, :description, :stream))
		redirect_to streams_path
		else
		render 'edit'
		end
	end

	def create
		@stream = Stream.new(stream_params)
		if @stream.save
			redirect_to streams_path
		else
			render 'index'
		end
	end

	def destroy
		@stream = Stream.find(params[:id])
		@stream.destroy

	private

	def stream_params
		params.require(:stream).permit(:user_id, :name, :description, :stream)
	end
	end