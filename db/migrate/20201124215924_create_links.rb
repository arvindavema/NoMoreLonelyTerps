class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :target_id, null: false
      
      t.timestamps
    end
  end
end
