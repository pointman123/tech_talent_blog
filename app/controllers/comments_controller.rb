class CommentsController < ApplicationController

	before_action :set_comment, only: [:edit, :update, :destroy]
	
include ApplicationHelper

  def edit
    @blog_post = BlogPost.find(@comment.blog_post_id)
    no_access_visitors(current_user, @blog_post)
  end

  def create
  	@comment = Comment.new(comment_params)

  	respond_to do |format|
  		if @comment.save
  			format.html {redirect_to blog_post_url(id: @comment.blog_post_id), notice: "Comment was created successfully!"}
  		else
  			format.html {redirect_to :back, notice: "Comment failed to post!"}
  		end
  	end
  end



  def update
  	respond_to do |format|
  		if @comment.update(comment_params)
  			format.html {redirect_to blog_post_url(id: @comment.blog_post_id), 
  				notice: "Comment was successfully updated"}
  		else
  			format.html { render :edit} 
  		end
  	end
  end
  def destroy
  	@comment.destroy
  	respond_to do |format|
  		format.html {redirect_to blog_post_url(id: @comment.blog_post_id),
  		 notice: "Your comment was deleted."}
  	end
  end
  private 
  def comment_params
  	params.require(:comment).permit(:comment, :user_id, :blog_post_id)
end
def set_comment
	@comment = Comment.find(params[:id])
end
end
