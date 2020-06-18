class AddPhotoPlaceholderToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo_placeholder, :string, default: "001-man"
  end
end
