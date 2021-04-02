class AddStatusToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :status, :string, default: "active"
    add_reference :apartments, :user, foreign_key: true
  end
end
