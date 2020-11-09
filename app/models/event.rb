class Event < ApplicationRecord
  validates :date, presence: { message: 'The event has to have a date' }
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :user_events, foreign_key: :attended_event_id
  has_many :attendees, through: :user_events, source: :attendee, dependent: :delete_all

  scope :upcoming, -> { where('date >= ?', Date.current) }
  scope :past, -> { where('date < ?', Date.current) }
end
