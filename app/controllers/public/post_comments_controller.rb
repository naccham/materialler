class Public::PostCommentsController < ApplicationController
  
  def create
    @site = Site.find(params[:site_id])
    comment = current_user.comments.new(site_id: @site.id)
    comment.site_id = site.id
    comment.save!
  end
  
  def destroy
    @site = Site.find(params[:site_id])
    comment = current_user.comments.find_by(site_id: @site.id)
    comment.site_id = site.id
    comment.destroy
    # if params[:mypage]
      # redirect_to user_path(current_user.id)
    # else
      # redirect_to sites_path
    # end
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
