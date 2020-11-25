class RenameColumnRooms < ActiveRecord::Migration[6.0]
  def change
    rename_column :rooms, :visibility, :public 
  end
end
