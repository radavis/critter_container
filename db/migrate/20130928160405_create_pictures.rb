class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title, null: false
      t.string :image
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
