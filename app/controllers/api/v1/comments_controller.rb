class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.includes(:comments).find(params[:post_id])
    render json: @post.comments
  end

  def show

  end

end