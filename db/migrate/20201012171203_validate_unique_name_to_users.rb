class ValidateUniqueNameToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :user_name, :string, unique: true
  end
end
