class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :date
      t.string :time
      t.boolean :public

      t.timestamps
    end
  end
end
