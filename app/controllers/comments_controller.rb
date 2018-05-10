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
  			format.html {redirect_to blog_post_url(id: @comment.blog_post_id), notice: "Comment failed to post!"}
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

#on this page line 45 added the word body to it to allow
#following should be posts/show
# <% content_for(:title, @post.title ) %>
# <p id="notice"><%= notice %></p>

# <h1>Blog</h1>
# <br>
# <div>
#   <%= image_tag @post.image.full.url %>
# </div>
# <div class="panel panel-default">
#   <div class="panel-heading">
#     <h2><em><%= @post.title %></em></h2>
#   </div>
#   <div class="panel-body">
#     <p><%= @post.content %></p>
#   </div>
# </div>

# <%= link_to 'Edit', edit_post_path(@post) %> |
# <%= link_to 'Back', posts_path %>

# <% @post.comments.each do |comment| %>
#   <%= comment.body %>
# <% end %>

# <%= form_for [@post, @post.comments.build] do |f| %>
#   <%= f.text_area :body %>
#   <%= f.submit "Submit" %>
# <% end %>
# <p>Comments: <%= @post.comments.count %></p>



#posts model like this
# class Post < ActiveRecord::Base
#     has_many :comments, dependent: :destroy
#     mount_uploader :image, PostUploader 

# end


#comments model

# class Comment < ActiveRecord::Base
#     belongs_to :user
#     belongs_to :post
# end

# #schema file
# create_table "comments", force: :cascade do |t|
#     t.string   "body"
#     t.integer  "user_id"
#     t.integer  "employee_id"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#     t.integer  "post_id"
#   end

#   add_index "comments", ["employee_id"], name: "index_comments_on_employee_id"
#   add_index "comments", ["post_id"], name: "index_comments_on_post_id"
#   add_index "comments", ["user_id"], name: "index_comments_on_user_id"

#   create_table "posts", force: :cascade do |t|
#     t.string   "title"
#     t.text     "content"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string   "image"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "username"
#     t.datetime "created_at",                          null: false
#     t.datetime "updated_at",                          null: false
#     t.string   "email",                  default: "", null: false
#     t.string   "encrypted_password",     default: "", null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",          default: 0,  null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.string   "current_sign_in_ip"
#     t.string   "last_sign_in_ip"
#   end

#   add_index "users", ["email"], name: "index_users_on_email", unique: true
#   add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true