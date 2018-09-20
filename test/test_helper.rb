ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)
#Minitest::Reporters.use! # [Minitest::Reporters::DefaultReporter.new(slow_count: 5)]


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def valid_event_hash
    {
    title: 'New Event',
    date: Time.now,
    city: 'Some Town',
    country_code: 'US',
    main_url: 'http://www.heise.de',
    total: 200,
    woman: 10,
    reporter: 'hosts'
    }
  end

end
