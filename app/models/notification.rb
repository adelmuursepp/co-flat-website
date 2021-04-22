class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  validates :user_id, :apartment_id, :notice_type, :description, presence: true
end
