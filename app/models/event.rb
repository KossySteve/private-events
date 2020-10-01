class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :attendance, source: :attendee
  has_many :attendance, foreign_key: :attended_event_id
  validates :description, presence: true
  scope :upcoming_event, -> { where('date >= ?', Date.current) }
  scope :past_event, -> { where('date < ?', Date.current) }
end
