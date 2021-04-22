class AddReadToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :read, :boolean, default: false 
  end
end
