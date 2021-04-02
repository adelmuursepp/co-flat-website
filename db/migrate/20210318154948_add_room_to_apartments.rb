class AddRoomToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :room_type, :string, default: ""
  end
end
