class CreateHollas < ActiveRecord::Migration[6.0]
  def change
    create_table :hollas do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username

      t.timestamps
    end
  end
end
