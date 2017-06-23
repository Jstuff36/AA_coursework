class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password])

    if user.nil?
      flash[:errors] = ["Invalid username or password"]
      render :new
    else
      login!(user)
      #redirect_to
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_sessions_url
  end
end
