class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @id = params[:id]

    unless (@user = User.where(id: @id).first)
      redirect_to action: 'index', status: 302
      return
    end

    @posts = @user.recent_posts
  end
end
