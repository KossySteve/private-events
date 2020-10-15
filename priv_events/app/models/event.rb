class Event < ApplicationRecord
    has_many :attendees
    belongs_to :user
    
    validates :description, :date, presence: true
end
