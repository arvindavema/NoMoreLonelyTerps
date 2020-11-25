class AddVisibilityColumnToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visibility, :boolean, null: false, default: true 
  end
end
