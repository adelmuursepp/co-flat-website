class AddMaximumstayToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :maximum_stay_in_months, :integer, default: 12
  end
end
