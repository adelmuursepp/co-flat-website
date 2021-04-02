class AddPreferredgenderToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :preferred_gender, :string, default: "Ei oma tähtsust"
  end
end
