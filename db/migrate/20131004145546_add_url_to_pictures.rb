class AddUrlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :url, :string
    add_index :pictures, :url, unique: true

    Picture.initialize_urls
  end
end
