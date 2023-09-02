class Api::V1::PostsController < ApplicationController
  def index
    @author_id = params[:user_id]
    @posts = Post.where(author_id: @author_id)

    if @posts
      render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: @posts }, status: :ok
    else
      render json: @posts.errors, status: :bad_request
    end
  end
end
