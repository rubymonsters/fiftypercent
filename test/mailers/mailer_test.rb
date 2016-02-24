require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "send admin notices mail" do
    # Send the email, then test that it got queued
    email = NotificationsMailer.new_event(events(:car_show)).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['admina@speakerinnen.org'], email.from
    assert_equal ['admina@speakerinnen.org', 'anne@speakerinnen.org'], email.to
    assert_equal 'New Event in 50 percent', email.subject
  end

end
