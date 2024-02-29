class Pony < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name,],
    using: {
      tsearch: { prefix: true }
    }
end
