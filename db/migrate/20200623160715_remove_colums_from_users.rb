class RemoveColumsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :birthday_date
    remove_column :users, :photo_placeholder
  end
end
