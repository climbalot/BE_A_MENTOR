class Mentor < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :topics, through: :mentor_topics
  has_many :reviews, through: :bookings
  has_many :mentor_topics, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
