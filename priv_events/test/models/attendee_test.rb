require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase
    def setup
        @attendee = Attendee.new
    end
    
    test 'invalid without email' do
        @attendee.email = nil
        refute @attendee.valid?, 'saved attendee without a email'
        assert_not_nil @attendee.errors[:email], 'no validation error for email present'
    end
    
end
