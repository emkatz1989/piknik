class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
	u = User.where(email: params[:email].first)
	if u && u.authenticate(params[:user][:password])
		session[:user_id] = u.id.to_s
		u.is_logged_in = true
		u.save
		redirect to streams_path
	else
		redirect_to new_session_path
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

