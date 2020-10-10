class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances

  before_save :downcase_fields
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
  

   def downcase_fields
      self.name.downcase!
   end

end
