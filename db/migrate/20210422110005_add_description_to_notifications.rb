class AddDescriptionToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :description, :string
  end
end
