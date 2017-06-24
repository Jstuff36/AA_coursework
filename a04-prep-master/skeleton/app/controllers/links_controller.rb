class LinksController < ApplicationController

  def new
    if logged_in?
      @link = Link.new
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create

    if logged_in?
      @link = Link.new(link_params)
      @link.user = current_user
      if @link.save
        redirect_to link_url(@link)
      else
        flash.now[:errors] = @link.errors.full_messages
        render :new
      end

    else
      redirect_to new_session_url
    end

  end

  def index
    if logged_in?
      @links = Link.all
      render :index
    else
      redirect_to new_session_url
    end
  end

  def show
    @link = Link.find(params[:id])
    if logged_in?
      render :show
    else
      redirect_to new_session_url
    end

  end

  def edit
    @link = Link.find(params[:id])
    if logged_in?
      render :edit
    else
      Flash.now[:errors] = "Please Log In"
      redirect_to new_session_url
    end
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end

  end

  private

  def link_params
    params.require(:link).permit( :title, :url )
  end
end
