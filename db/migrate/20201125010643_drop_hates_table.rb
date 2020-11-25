class DropHatesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :hates 
  end
end
