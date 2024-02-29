class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pony
  validates :start_time, presence: true
  validates :end_time, presence: true
  scope :pending, -> { where(status: 'Pending') }
  scope :accepted, -> { where(status: 'Accepted') }
  scope :declined, -> { where(status: 'Declined') }
end
