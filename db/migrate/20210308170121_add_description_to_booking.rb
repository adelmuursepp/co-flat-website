class AddDescriptionToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :description, :string, default: ""
  end
end
