class PostsController < ApplicationController

before_action :index, except: :index


  def index
    @posts = Post.all.order("created_at DESC")
    @notes = Note.all
    @user_notes = current_user.notes
    # includes(:user).order("created_at DESC") ここは後で
  end

  def new
    @posts = Post.new
    # @notes = Note.find(params[:format])
  end

  def create
    Post.create(post_params)
     redirect_to message_note_path(params[:post][:note_id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
      if post.user_id == current_user.id
        post.destroy
      end
  end

  def edit
    @posts = Post.find(params[:id])
    @note = @posts.note
  end

  def update
      post = Post.find(params[:id])
     if post.user_id == current_user.id
        post.update(post_params)
     end
     redirect_to message_note_path(params[:post][:note_id])
  end


  def show
    @posts = Post.find(params[:id])
    # @note = @posts.note
    # @note = Note.find(params[:id])
        # @comments = @post.comments.includes(:user)
  end


 private
  def post_params
    params.require(:post).permit(:note_id, :name ,:image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


 end


