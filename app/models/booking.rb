class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  monetize :amount_cents

  # enum status: {Waiting: 0, Approved: 1, Declined: 2}
end
