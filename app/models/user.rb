class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'

  has_many :user_events, foreign_key: :attendee_id
  has_many :attended_events, through: :user_events, dependent: :delete_all

  validates :username, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
end
