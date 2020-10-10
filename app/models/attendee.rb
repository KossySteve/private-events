class Attendee < ApplicationRecord
    belongs_to :event
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
end
