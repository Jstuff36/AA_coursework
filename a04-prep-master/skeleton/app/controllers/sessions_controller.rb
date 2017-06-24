class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(sessions_param[:username], sessions_param[:password])
    if @user
      login!(@user)
      redirect_to links_url
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

  private

  def sessions_param
    params.require(:user).permit(:username, :password)
  end
end
