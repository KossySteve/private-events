class User < ApplicationRecord
    has_many :events
  
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
end
