class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances

  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }

end
