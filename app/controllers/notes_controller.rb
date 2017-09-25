class NotesController < ApplicationController

  def index
    @notes= Note.all
    @users= User.all
    @note= Note.new

  end

  def new
   @notes= Note.new
  end

  def create
   @note = Note.new(note_params)
   @note.save
   @notes = Note.all
   redirect_to message_note_path(@note.id)
  end


  def show
  end

  def message
    current_user.notes
    # @posts = Post.all.order("created_at DESC")
    @posts = Post.where(note_id: params[:id]).order("created_at DESC")
    @notes = Note.all
    @user_notes = current_user.notes
    @current_note = Note.find(params[:id])
    @note_id= params[:id]
  end

  private
  def note_params
   # params.require(:note).
   params.require(:note).permit(user_ids: [])
  end


end
