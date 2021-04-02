class AddCityToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :city, :string
    add_column :apartments, :neighborhood, :string
  end
end
