class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  has_many :attendance, foreign_key: :attendee_id
  has_many :attended_events, through: :attendance

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }

    def upcoming_event
        events.where('date >= ?', Date.today)
    end

    def previous_event
        events.where('date < ?', Date.today)
    end

end
