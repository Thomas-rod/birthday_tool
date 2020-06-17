class CreateBirthdays < ActiveRecord::Migration[6.0]
  def change
    create_table :birthdays do |t|
      t.references :friend
      t.date :start
      t.integer :age
      t.timestamps
    end
  end
end
