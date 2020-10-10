class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  has_many :attendees

  validates :description, presence: true
  scope :upcoming_event, -> { where('date >= ?', Date.current) }
  scope :past_event, -> { where('date < ?', Date.current) }
end
