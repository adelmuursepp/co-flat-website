class AddShowaddressToApartment < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :show_address, :boolean, default: false
  end
end
