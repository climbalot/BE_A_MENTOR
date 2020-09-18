class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  has_one :review, dependent: :destroy
end
