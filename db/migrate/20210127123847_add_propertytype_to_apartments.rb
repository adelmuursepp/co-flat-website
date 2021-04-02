class AddPropertytypeToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :propertytype, :string
  end
end
