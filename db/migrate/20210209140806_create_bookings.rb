class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :state
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true
      t.monetize :amount
      t.timestamps
    end
  end
end
