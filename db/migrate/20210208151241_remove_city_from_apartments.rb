class RemoveCityFromApartments < ActiveRecord::Migration[6.0]
  def change
    remove_column :apartments, :city, :string
    remove_column :apartments, :house_number, :string
    remove_column :apartments, :zip_code, :string
    remove_column :apartments, :street, :string
  end
end
