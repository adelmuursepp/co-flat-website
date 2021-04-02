class AddAvailableuntilToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :available_until, :string, default: ""
  end
end
