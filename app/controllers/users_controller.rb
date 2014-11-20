class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def edit
	end

	def index
		@users = User.all
	end

	def create
		@user = User.create(user_params)
		  if @user.save
		  	redirect_to users_path, :notice => "User was successfully created!"
		  else 
		  	redirect_to root_path
		  end
		end

	def update
		@user.update_attributes(user_params)
	end

	def destroy
		user.destroy
	end

	private

	def set_user
      @user = User.find(params[:id])
    end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :stream)
	end

end

