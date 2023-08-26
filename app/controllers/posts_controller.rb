class PostsController < ApplicationController
  def index
    @users = User.all
    @author_id = params[:user_id]
    @user = User.find(@author_id)
    @posts = Post.where(author_id: @author_id)
    @comments = Comment.all
  end

  def show
    @users = User.all
    @id = params[:id]
    current_user
    unless (@post = Post.where(id: @id).first)
      redirect_to action: 'index', status: 302
      return
    end
    @comments = @post.recent_comments
  end

  def new
    @user = User.new
  end

  def create
    user = User.find(current_user.id)
    title = params[:title]
    text = params[:text]
    @post = Post.create(author: user, title: title, text: text)
    @post.save
    redirect_to user_posts_path
  end
end
