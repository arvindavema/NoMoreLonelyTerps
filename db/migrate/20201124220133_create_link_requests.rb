class CreateLinkRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :link_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :target_id, null: false
      t.boolean :accepted, null: false, default: false
      t.boolean :declined, null: false, default: false
      
      t.timestamps
    end
  end
end
