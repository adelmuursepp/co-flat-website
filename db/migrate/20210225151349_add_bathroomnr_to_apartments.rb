class AddBathroomnrToApartments < ActiveRecord::Migration[6.0]
  def change
    remove_column :apartments, :roomnumber, :integer
    add_column :apartments, :bedroomnumber, :integer, default: 1
    add_column :apartments, :bathroomnumber, :integer, default: 1
  end
end
