class AddReminderToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :reminder_previous_day, :boolean, default: false
    add_column :friends, :reminder_today_morning, :boolean, default: false
    add_column :friends, :reminder_today_noon, :boolean, default: false
    add_column :friends, :reminder_today_night, :boolean, default: false
  end
end
