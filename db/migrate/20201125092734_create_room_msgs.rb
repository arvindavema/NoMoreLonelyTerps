class CreateRoomMsgs < ActiveRecord::Migration[6.0]
  def change
    create_table :room_msgs do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :msg

      t.timestamps
    end
  end
end
