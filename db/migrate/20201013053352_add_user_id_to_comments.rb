class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer, null: false
    change_column :comments, :body, :string, null: false
  end
end
