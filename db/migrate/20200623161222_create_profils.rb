class CreateProfils < ActiveRecord::Migration[6.0]
  def change
    create_table :profils do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :photo_placeholder
      t.date :birthday_date
      t.references :user
      t.timestamps
    end
  end
end
