class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: selected_user
  end

  def update
    @user = selected_user
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def destroy
    @user = selected_user
    @user.destroy
    render json: @user
  end

  private

  def selected_user
    User.find_by(id: params[:id])

  end

  def user_params
    params.require(:user).permit(:username)
  end

end
