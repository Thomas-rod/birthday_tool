class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, default: 'John'
    add_column :users, :last_name, :string, default: 'Doe'
    add_column :users, :birthday_date, :date, default: Date.new
  end
end
