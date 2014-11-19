class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect to streams_path
	else
		redirect_to users_path
	end
end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
	end

	private

	def user_params
		params.require(:user).permit(:email, :password_digest)
	end

end

