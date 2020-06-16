class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :nickname
      t.date :birthday_date
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
