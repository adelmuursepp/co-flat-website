class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true
      t.integer :identifier
      t.string :type

      t.timestamps
    end
  end
end
