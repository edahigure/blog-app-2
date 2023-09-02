class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.includes(:comments).find(params[:post_id])
    render json: @post.comments
  end

  def create
    post_id = params[:id]
    user_id = params[:user_id]
    user = User.find(user_id)
    post = Post.find(post_id)
    comments =Comments.new(comments_params)
    comments.author = User.find(user_id)
    comment.post = Post.find(post_id)
  
    if comments.save
      render json: {status: "SUCCESS", message: "comments was created successfully!", data: comments}, status: :created
    else
      render json: comments.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def comments_params
    params.require(:comments).permit(:text)
  end
end