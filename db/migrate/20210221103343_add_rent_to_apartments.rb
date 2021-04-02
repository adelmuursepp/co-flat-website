class AddRentToApartments < ActiveRecord::Migration[6.0]
  def change
    add_monetize :apartments, :rent, currency: { present: false }
  end
end
