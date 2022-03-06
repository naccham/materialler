class Public::CommentsController < ApplicationController
  
  def create
    @site = Site.find(params[:site_id])
    @comment = current_user.comments.new(comment_params)
    @comment.site_id = @site.id
    if @comment.save
      redirect_to site_path(@site), notice: 'コメントを投稿しました'
    else
      render 'sites/show'
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], site_id: params[:site_id]).destroy
    redirect_to site_path(params[:site_id]), alert: 'コメントを削除しました'
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
