class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
    add_index :rooms, :name, unique: true
  end
end
