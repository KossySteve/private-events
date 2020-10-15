require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Eze", email: "ez@gmail.com")
  end
  test "user should be valid" do
     assert @user.valid?
  end
  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'user can create events' do
    @event = Event.create(description: "Hello", date: "2020-10-13", user_id: 1 )
    @user.events << @event
    assert_equal 1, @user.events.size
  end
 
end
