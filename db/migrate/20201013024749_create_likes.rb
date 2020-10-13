class CreateLikes < ActiveRecord::Migration[6.0]

  def change
    drop_table :favorites
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :holla, null: false, foreign_key: true

      t.timestamps
    end

    create_table :hates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :holla, null: false, foreign_key: true
      t.timestamps
    end
  end


end
