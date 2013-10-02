class AddStateToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :state, :string, null: false
  end
end
