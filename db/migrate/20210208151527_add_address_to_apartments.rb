class AddAddressToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :address, :string
  end
end
