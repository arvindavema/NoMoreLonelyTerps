class DropHollasTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :hollas 
  end
end
