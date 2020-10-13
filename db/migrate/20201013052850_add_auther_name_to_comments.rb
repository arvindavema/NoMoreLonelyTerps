class AddAutherNameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :author_name, :string, null: false
  end
end
