source 'https://rubygems.org'
ruby '2.4.2'

gem 'rails', '~> 5.2', '>= 5.2.1'

# used in the rail 5.2 version
gem 'bootsnap', '~> 1.3'

gem 'pg',  '0.20.0'

gem 'sass-rails', '~> 5.0.6'
gem 'jquery-rails'
gem 'uglifier', '>= 2.7.0'
gem 'execjs'
# gem 'therubyracer',  platforms: :ruby

gem 'bcrypt'
gem 'rails-i18n'
gem 'globalize', git: 'https://github.com/globalize/globalize'
gem 'kaminari'
gem 'acts-as-taggable-on', git: 'https://github.com/Fodoj/acts-as-taggable-on.git', branch: 'rails-5.2'  # temporary: https://github.com/mbleigh/acts-as-taggable-on/issues/874
# gem 'acts-as-taggable-on'
gem 'carrierwave',       '~> 0.10.0'

gem 'bootstrap-sass',     '~> 3.3.7'
gem 'bootstrap_form',     '~> 2.7.0'
gem 'morrisjs-rails'
gem 'raphael-rails'
gem 'country_select',    '~> 2.1.0'
gem 'redcarpet',         '~> 3.2.2'

gem 'font-awesome-rails'
gem 'nokogiri'

gem 'rack-attack',       '~> 4.2.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

group :development do
  gem 'puma'
  # gem 'quiet_assets'
  gem 'capistrano',       '~> 3.4', require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-passenger', require: false
end

group :test do
  gem 'minitest-reporters'
end

group :test, :development do
  gem 'pry-rails'
  gem 'spring'
  gem 'faker'
end
