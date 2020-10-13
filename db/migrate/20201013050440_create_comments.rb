class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id, null: false
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
