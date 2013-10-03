class AddStateToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :state, :string, null: false, default: 'pending'
  end
end
