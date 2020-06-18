class AddPhotoPlaceholderToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :photo_placeholder, :string, default: "001-man"
  end
end
