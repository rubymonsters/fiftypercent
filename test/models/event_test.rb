require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # only works it locale == :de
  test "events know their country name" do
    assert_equal events(:car_show).country_name, 'Deutschland'
  end
  
  test "a new event has the right name" do
    assert_equal Event.new(country_code: 'FR').country_name, 'Frankreich'
  end
end
