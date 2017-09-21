class AddNoteIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :note_id, :integer
  end
end
