class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :intro
      t.integer :rent
      t.text :description
      t.datetime :date
      t.string :main_photo

      t.string :street
      t.string :house_number
      t.string :zip_code
      t.string :city
      t.float :latitude
      t.float :longitude

      t.integer :deposit
      t.string :available
      t.integer :minimum_stay_in_months
      t.integer :room_size_m2
      t.integer :apartment_size_m2
      t.string :bed_type
      t.integer :bathrooms_number

      t.integer :flatmates_female, default: 0
      t.integer :flatmates_male, default: 0
      t.integer :min_preferred_flatmate_age, default: 18
      t.integer :max_preferred_flatmate_age 
      t.boolean :preferred_flatmate_is_male
      t.boolean :preferred_flatmate_is_female

      t.boolean :is_wifi
      t.boolean :is_tv
      t.boolean :is_washing_machine
      t.boolean :is_lift
      t.boolean :is_furniture
      t.boolean :is_terrace
      t.boolean :is_balcony
      t.boolean :is_garden
      t.boolean :is_parking
      t.boolean :is_private_bathroom
      t.boolean :is_dishwasher
      t.boolean :is_pet_friendly
      t.boolean :is_smoker_friendly
      t.boolean :is_couples_friendly
      
      t.timestamps
    end
  end
end
