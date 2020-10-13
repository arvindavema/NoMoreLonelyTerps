class AddLoopCountToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :loop_count, :integer, null: false, default: 0
  end
end
