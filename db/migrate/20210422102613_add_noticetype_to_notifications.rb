class AddNoticetypeToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :notice_type, :string
  end
end
