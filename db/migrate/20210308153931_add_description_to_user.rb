class AddDescriptionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :string, default: ""
  end
end
