class Rating < ApplicationRecord
  belongs_to :booking

  has_many :ratings, dependent: :destroy
end
