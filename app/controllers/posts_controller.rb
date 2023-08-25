class PostsController < ApplicationController
  def index
    @users=User.all
    @author_id = params[:user_id]
    @user = User.find(@author_id)
    @posts = Post.where(author_id: @author_id )
    @comments = Comment.all
    

  end

  def show
    @users=User.all
    @id = params[:id]



    unless @post = Post.where(id: @id).first
      redirect_to action: 'index', status: 302
    end

    @comments = Comment.where(post_id: @id )
  end

  
end
