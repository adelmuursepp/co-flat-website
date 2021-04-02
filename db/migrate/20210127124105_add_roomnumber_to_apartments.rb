class AddRoomnumberToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :roomnumber, :integer
  end
end
