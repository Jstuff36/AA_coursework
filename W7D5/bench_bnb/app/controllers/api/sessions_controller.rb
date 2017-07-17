class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      sign_in(@user)
      render 'api/users/show'
    else
      render(json: ["Invalid username or password"], status: 401)
    end

  end

  def destroy

    if current_user
      sign_out
      render json: {}
    else
      render(json: ["Nobody Signed In"], status: 404)
    end
  end

end
