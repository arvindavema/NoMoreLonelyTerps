class AddHollaToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :holla_id, :integer,null: false
  end
end
