class PostsController < ApplicationController

before_action :move_to_index, except: :index

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
      if post.user_id == current_user.id
        post.destroy
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
     if post.user_id == current_user.id
        post.update(post_params)
     end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

private
  def post_params
  params.permit(:name, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
