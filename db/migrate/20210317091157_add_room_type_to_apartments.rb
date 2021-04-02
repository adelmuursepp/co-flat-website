class AddRoomTypeToApartments < ActiveRecord::Migration[6.0]
  def change
    change_column :apartments, :name, :string, default: ""
    change_column :apartments, :intro, :string, default: ""
    change_column :apartments, :description, :string, default: ""
    change_column :apartments, :date, :string, default: ""
    change_column :apartments, :main_photo, :string, default: ""
    change_column :apartments, :deposit,:integer, default: 0
    change_column :apartments, :available, :string, default: ""
    change_column :apartments, :minimum_stay_in_months, :integer, default: 1
    change_column :apartments, :room_size_m2, :integer, default: 0
    change_column :apartments, :apartment_size_m2, :integer, default: 0
    change_column :apartments, :bed_type, :string, default: ""
    change_column :apartments, :bathrooms_number, :integer, default: 0
    change_column :apartments, :flatmates_female, :integer, default: 0
    change_column :apartments, :flatmates_male, :integer, default: 0
    change_column :apartments, :min_preferred_flatmate_age, :integer, default: 18
    change_column :apartments, :max_preferred_flatmate_age, :integer, default: 0
    change_column :apartments, :preferred_flatmate_is_male, :boolean, default: true
    change_column :apartments, :preferred_flatmate_is_female, :boolean, default: true
    change_column :apartments, :is_wifi, :boolean, default: false
    change_column :apartments, :is_tv, :boolean, default: false
    change_column :apartments, :is_washing_machine, :boolean, default: false
    change_column :apartments, :is_lift, :boolean, default: false
    change_column :apartments, :is_furniture, :boolean, default: false
    change_column :apartments, :is_terrace, :boolean, default: false
    change_column :apartments, :is_balcony, :boolean, default: false
    change_column :apartments, :is_garden, :boolean, default: false
    change_column :apartments, :is_parking, :boolean, default: false
    change_column :apartments, :is_private_bathroom, :boolean, default: false
    change_column :apartments, :is_dishwasher, :boolean, default: false
    change_column :apartments, :is_pet_friendly, :boolean, default: false
    change_column :apartments, :is_smoker_friendly, :boolean, default: false
    change_column :apartments, :is_couples_friendly, :boolean, default: false
    change_column :apartments, :propertytype, :string, default: ""
    change_column :apartments, :address, :string, default: ""
    change_column :apartments, :city, :string, default: ""
    change_column :apartments, :neighborhood, :string, default: ""
  end
end
