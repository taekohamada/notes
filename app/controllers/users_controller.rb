class UsersController < ApplicationController

  def index
  end

  def show
    user = User.find(params[:id])
    @username = user.username
    @posts = user.posts.page(params[:page]).per(5).order("created_at DESC")
  end



end
