class LinksController < ApplicationController

  def new
    if logged_in?
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

    if logged_in?
      render :show
    else
      redirect_to new_session_url
    end

  end

  def edit
    if logged_in?
      render :edit
    else
      redirect_to new_session_url
    end
  end

  def update
    @link = Link.find(params[:id])
    if current_user.id == @link.user_id
      @link.title = params[:link][:title]
      @link.save
    end

  end

  private

  def link_params
    params.require(:link).permit( :title, :url )
  end
end
