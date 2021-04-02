class Apartment < ApplicationRecord
    has_many_attached :photos
    has_one_attached :main_photo
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    monetize :rent_cents
    has_many :bookings
    belongs_to :user

    validates :flatmates_female, numericality: { greater_than_or_equal_to: 1 }
    validates :flatmates_male, numericality: { greater_than_or_equal_to: 1 }


end
