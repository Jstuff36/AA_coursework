class UsersController < ApplicationController
  before_action :sendback, only: [:new, :create]
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to cats_url
    end
    # else
    #   flash.now[:errors] = @user.errors.full_messages
  end





  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
