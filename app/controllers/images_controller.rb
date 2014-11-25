class ImagesController < ApplicationController

def new
  @image=Image.new
end

def create
  @user_id = current_user.id 
  @image= Image.new(params[:user_id, :stream_id])
  @image.save
end

def destroy
	@image = Image.find(params[:id])
	@image.destroy
end

private

def image_params
	params.require(:image, :has_attached_image, :user_id, :stream_id)
end