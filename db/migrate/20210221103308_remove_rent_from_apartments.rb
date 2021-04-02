class RemoveRentFromApartments < ActiveRecord::Migration[6.0]
  def change
    remove_column :apartments, :rent, :integer
  end
end
