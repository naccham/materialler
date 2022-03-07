class Public::CommentsController < ApplicationController
  
  def create
    @site = Site.find(params[:site_id])
    @comment = current_user.comments.new(comment_params)
    @comment.site_id = @site.id
    if @comment.save
      render :site_comments
    else
      render 'sites/show'
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], site_id: params[:site_id]).destroy
    @site = Site.find(params[:site_id])
    render :site_comments
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
