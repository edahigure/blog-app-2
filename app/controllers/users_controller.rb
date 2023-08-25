class UsersController < ApplicationController
  def index; 
  @users=User.all
  end

  def show
    @id = params[:id]
    @posts=Post.all

    unless @user = User.where(id: @id).first
      redirect_to action: 'index', status: 302
    end
  end
end
