class AddIsbookableToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :is_bookable, :boolean, default: false
  end
end
