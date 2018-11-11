require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "events know their country name" do
    old_locale = I18n.locale
    I18n.locale = :de
    assert_equal events(:car_show).country_name, 'Deutschland'
    I18n.locale = old_locale
  end

  test "a new event has the right country name" do
    old_locale = I18n.locale
    I18n.locale = :fr
    assert_equal Event.new(country_code: 'FR').country_name, 'France'
    I18n.locale = old_locale
  end

  test "should not save an event without a title" do
    assert_not Event.new.save
  end

  test "search finds events by title" do
    assert_equal Event.search('bit').size, 1
    assert_equal Event.search('bit').first, events(:cebit)
  end

  test "search finds events by subtitle" do
    assert_equal Event.search('super').size, 1
    assert_equal Event.search('super').first, events(:car_show)
  end

  test "search finds events by description" do
    assert_equal Event.search('such').size, 1
    assert_equal Event.search('such').first, events(:car_show)
  end

  test "search finds events by reporter" do
    assert_equal Event.search('inge').size, 1
    assert_equal Event.search('such').first, events(:car_show)
  end

  test "events without a mod_state are unchecked" do
    assert Event.new.unchecked?
    refute Event.new(mod_state: 'anything').unchecked?
  end

  test "events with modstat ok are published" do
    assert Event.new(mod_state: 'ok').published?
    refute Event.new(mod_state: 'not-ok').published?
  end

  test "events with modstat hidden are hidden" do
    assert Event.new(mod_state: 'hidden').hidden?
    refute Event.new(mod_state: 'not-hidden').hidden?
  end

  test "Event.published finds all published events" do
    assert_equal Event.published.size, 3
    assert_includes Event.published.all, events(:car_show)
    assert_includes Event.published.all, events(:flower_conf)
  end

  test "Event.unchecked finds all unchecked events" do
    assert_equal Event.unchecked.size, 1
    assert_equal Event.unchecked.first, events(:cebit)
  end

  test "Event.counted finds all counted events" do
    assert_equal Event.counted.size, 3
  end

  test "Event knows if has been recently_created?" do
    event = Event.create!(valid_event_hash)
    assert event.recently_created?
  end

  test "Event knows if has NOT been recently_created?" do
    event = Event.create!(valid_event_hash)
    event.created_at = 2.days.ago
    event.save!
    assert_not event.recently_created?
  end

  test 'can be edited by author' do
    event = Event.create!(valid_event_hash)
    assert event.frontend_editable?([event.id])
  end

  test 'can NOT be edited by author if to old' do
    event = Event.create!(valid_event_hash)
    event.created_at = 2.hours.ago
    assert_not event.frontend_editable?([event.id])
  end

  test 'can NOT be edited by someone else' do
    event = Event.create!(valid_event_hash)
    assert_not event.frontend_editable?(nil)
  end
end
