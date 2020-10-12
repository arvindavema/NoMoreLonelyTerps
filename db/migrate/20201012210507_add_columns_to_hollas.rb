class AddColumnsToHollas < ActiveRecord::Migration[6.0]
  def change
    add_column :hollas, :body, :string
    add_column :hollas, :photo, :string
  end
end
