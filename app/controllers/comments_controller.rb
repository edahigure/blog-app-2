class CommentsController < ApplicationController
  def new
    @user = User.new
    @var = 'Here ok'
  end

  def create
    user = User.find(current_user.id)
    post = Post.find(params[:post_id])

    text = params[:text]
    @comment = Comment.create(post: post, author: user, text: text)
    @comment.save
    redirect_to user_posts_path
  end
end
