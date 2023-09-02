class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.includes(:comments).find(params[:post_id])
    render json: @post.comments
  end

  def create
    post_id = params[:post_id]

    user_id = params[:user_id]
    User.find(user_id)
    Post.find(post_id)

    comments = Comment.new(params.require(:comment).permit(:text))

    comments.author = User.find(user_id)
    comments.post = Post.find(post_id)

    if comments.save
      render json: { status: 'SUCCESS', message: 'comments was created successfully!', data: comments },
             status: :created
    else
      render json: comments.errors, status: :unprocessable_entity
    end
  end
end
