class User < ApplicationRecord
    has_many :events
    #has_many :attendees, class_name: "User",foreign_key: "creator_id"  
    #belongs_to :creator, class_name: "User", optional: true
 
end
