class Schedule < ApplicationRecord
  belongs_to :mentor
  has_many :bookings

  validates :start, uniqueness: { scope: :mentor_id, message: "You have already made this time available" }
end
