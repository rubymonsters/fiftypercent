require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fiftypercent
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :de
    config.i18n.fallbacks = true
    config.load_defaults 5.0

    Globalize.fallbacks = {:en => [:en, :de], :de => [:de, :en]}

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    ActsAsTaggableOn.remove_unused_tags = true

    # throttle requests to prevent mass event posting
    config.middleware.use Rack::Attack

    # set to false if you want to see asset-requests in development-logs
    # config.quiet_assets = false

    # config.active_record.raise_in_transactional_callbacks = true
  end
end
