class SessionsController < ApplicationController
include ApplicationHelper 
def new
	@user = User.new
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


