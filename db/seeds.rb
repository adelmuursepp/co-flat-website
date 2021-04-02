# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts('Cleaning database...')

Booking.destroy_all
Apartment.destroy_all

# apartment1 = Apartment.create!(name: "Tuukri tn kahetoaline", intro: "Ülikooli lähedal", rent: 15000, description: "Köögivarustus, loomad teretulnud",
# address: "Krusanteemi tee 10, Viimsi, Estonia", main_photo: "https://unsplash.com/photos/MP0bgaS_d1c", deposit: 100, available: "Praegu", minimum_stay_in_months: 4,
# flatmates_female: 1, flatmates_male: 1, min_preferred_flatmate_age: 18, max_preferred_flatmate_age: 40,
# preferred_flatmate_is_male: true, preferred_flatmate_is_female: true, room_size_m2: 20, apartment_size_m2: 80,
# bed_type: "Eraldi voodi", bathrooms_number: 1, is_tv: true, is_wifi: true, is_washing_machine: true, is_lift: true,
# is_furniture: true, is_terrace: true, is_garden: true, is_parking: true, is_balcony: true, is_private_bathroom: true,
# is_dishwasher: true, is_pet_friendly: true, is_smoker_friendly: true, is_couples_friendly: true, latitude: 59.436962, longitude: 24.753574, propertytype: "Eraldi ruum",
# roomnumber: 4)

# apartment2 = Apartment.create!(name: "Veski tn kahetoaline", intro: "Ülikooli lähedal", rent: 25000, description: "Köögivarustus, loomad teretulnud",
# address: "Krusanteemi tee 10, Viimsi, Estonia", main_photo: "https://unsplash.com/photos/gREquCUXQLI", deposit: 100, available: "Praegu", minimum_stay_in_months: 4,
# flatmates_female: 1, flatmates_male: 1, min_preferred_flatmate_age: 18, max_preferred_flatmate_age: 40,
# preferred_flatmate_is_male: true, preferred_flatmate_is_female: true, room_size_m2: 20, apartment_size_m2: 80,
# bed_type: "Eraldi voodi", bathrooms_number: 1, is_tv: true, is_wifi: true, is_washing_machine: true, is_lift: true,
# is_furniture: true, is_terrace: true, is_garden: true, is_parking: true, is_balcony: true, is_private_bathroom: true,
# is_dishwasher: true, is_pet_friendly: true, is_smoker_friendly: true, is_couples_friendly: true, latitude: 59.436962, longitude: 24.753574, propertytype: "Eraldi ruum",
# roomnumber: 4)

# apartment3 = Apartment.create!(name: "Tammsaare tn kahetoaline", intro: "Ülikooli lähedal", rent: 30000, description: "Köögivarustus, loomad teretulnud",
# address: "Krusanteemi tee 10, Viimsi, Estonia", main_photo: "https://unsplash.com/photos/9uH-hM0VwPg", deposit: 100, available: "Praegu", minimum_stay_in_months: 4,
# flatmates_female: 1, flatmates_male: 1, min_preferred_flatmate_age: 18, max_preferred_flatmate_age: 40,
# preferred_flatmate_is_male: true, preferred_flatmate_is_female: true, room_size_m2: 20, apartment_size_m2: 80,
# bed_type: "Eraldi voodi", bathrooms_number: 1, is_tv: true, is_wifi: true, is_washing_machine: true, is_lift: true,
# is_furniture: true, is_terrace: true, is_garden: true, is_parking: true, is_balcony: true, is_private_bathroom: true,
# is_dishwasher: true, is_pet_friendly: true, is_smoker_friendly: true, is_couples_friendly: true, latitude: 59.436962, longitude: 24.753574, propertytype: "Eraldi ruum",
# roomnumber: 4)

# apartment4 = Apartment.create!(name: "Tammsaare tn kahetoaline", intro: "Ülikooli lähedal", rent: 40000, description: "Köögivarustus, loomad teretulnud",
# address: "Krusanteemi tee 10, Viimsi, Estonia", main_photo: "https://unsplash.com/photos/D1YruV0KUDw", deposit: 100, available: "Praegu", minimum_stay_in_months: 4,
# flatmates_female: 1, flatmates_male: 1, min_preferred_flatmate_age: 18, max_preferred_flatmate_age: 40,
# preferred_flatmate_is_male: true, preferred_flatmate_is_female: true, room_size_m2: 20, apartment_size_m2: 80,
# bed_type: "Eraldi voodi", bathrooms_number: 1, is_tv: true, is_wifi: true, is_washing_machine: true, is_lift: true,
# is_furniture: true, is_terrace: true, is_garden: true, is_parking: true, is_balcony: true, is_private_bathroom: true,
# is_dishwasher: true, is_pet_friendly: true, is_smoker_friendly: true, is_couples_friendly: true, latitude: 59.436962, longitude: 24.753574, propertytype: "Eraldi ruum",
# roomnumber: 4)
