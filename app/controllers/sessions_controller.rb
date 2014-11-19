class SessionsController < ApplicationController
include ApplicationHelper 
def new
	@user = User.new
end

def create
		# Find the user that is trying to log in		
		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			session[:user_id] = u.id.to_s
			redirect_to users_path
		else
			# Go back to the login page
			flash[:notice] = "There's something wrong here..."
			redirect_to new_session_path
		end
	end

def destroy
	if session[:user_id]
		u = User.where(id: session[:user_id]).first
		u.is_logged_in = false
		u.save
	end
	reset_session
	redirect_to new_session_path
	end
end


