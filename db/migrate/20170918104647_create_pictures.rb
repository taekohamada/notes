class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
