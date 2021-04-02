class AddIsdeskToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :is_desk, :boolean, default: false
  end
end
