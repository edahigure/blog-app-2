class LikesController < ApplicationController
  def create
    post_id = params[:post_id]
    Like.create(author_id: current_user.id, post_id: post_id)
    redirect_to user_posts_path
  end
end
