class AddDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :rent_for_months, :integer
    add_column :users, :moving_in, :string
    add_column :users, :city, :string
    add_column :users, :university, :string
    add_column :users, :degree, :string
    add_column :users, :works_fulltime, :boolean
    add_column :users, :works_parttime, :boolean
    add_column :users, :studying, :boolean
    add_column :users, :looking_flatmates, :boolean
    add_column :users, :looking_flat, :boolean
    add_column :users, :facebook_link, :string
    add_column :users, :ig_link, :string
    add_column :users, :min_rent, :integer
    add_column :users, :max_rent, :integer
  
  end
end
