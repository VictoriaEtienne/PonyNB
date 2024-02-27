class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pony
  validates :start_time, presence: true
  validates :end_time, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2 }
end
