class Apartment < ApplicationRecord
    has_many_attached :photos
    has_one_attached :main_photo
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    monetize :rent_cents
    has_many :bookings, dependent: :destroy
    belongs_to :user
    has_many :notifications, dependent: :destroy
    has_many :reservations

    # validates :flatmates_female, numericality: { greater_than_or_equal_to: 0 }
    # validates :flatmates_male, numericality: { greater_than_or_equal_to: 0 }
    # In the order that it shows on apartments#new
    validates :intro, length: {minimum: 5}
    validates :description, length: {minimum: 10}
    validates :room_size_m2, presence: true
    validates :apartment_size_m2, presence: true
    validates :address, length: {minimum: 3}
    validates :rent, presence: true
    validates :city, length: {minimum: 3}
    validates :neighborhood, length: {minimum: 3}
    validates :room_type, presence: true
    validates :photos, presence: true

end
