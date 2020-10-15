require 'test_helper'

class EventTest < ActiveSupport::TestCase
 
  def setup
    @event = Event.new
  end

  test 'invalid without date' do
    @event.date = nil
    refute @event.valid?, 'saved event without a date'
    assert_not_nil @event.errors[:date], 'no validation error for date present'
  end

  test 'invalid without description' do
    @event.description = nil
    refute @event.valid?
    assert_not_nil @event.errors[:description]
  end
  test 'event can have attendees' do
    @attendee = Attendee.create(email: "hello@gmail.com", event_id: 1 )
    @event.attendees << @attendee
    assert_equal 1, @event.attendees.size
    end
  
end
