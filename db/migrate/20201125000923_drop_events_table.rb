class DropEventsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :events
    drop_table :link_requests
    drop_table :links 
  end
end
