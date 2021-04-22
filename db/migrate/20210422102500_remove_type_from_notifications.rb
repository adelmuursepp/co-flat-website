class RemoveTypeFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :type, :string
  end
end
