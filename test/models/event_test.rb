require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "events know their country name" do
    old_locale = I18n.locale
    I18n.locale = :de
    assert_equal events(:car_show).country_name, 'Deutschland'
    I18n.locale = old_locale
  end

  test "a new event has the right name" do
    old_locale = I18n.locale
    I18n.locale = :fr
    assert_equal Event.new(country_code: 'FR').country_name, 'France'
    I18n.locale = old_locale
  end

  test "should not save an event without a title" do
    assert_not Event.new.save
  end
end
