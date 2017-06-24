class CommentsController < ApplicationController

  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    p params
    if logged_in?
      if @comment.save
        redirect_to link_url(@comment.link_id)
      else
        flash.now[:errors] = @comment.errors.full_messages
        redirect_to link_url(@comment.link_id)
      end
    else
      redirect_to new_session_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
