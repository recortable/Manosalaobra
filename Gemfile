source 'https://rubygems.org'

gem 'rails', '3.2.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end


gem 'jquery-rails'
gem 'simple_form'
gem 'decent_exposure'
gem 'cancan'
gem 'redcarpet'
gem 'friendly_id'
gem 'globalize3'
gem 'paper_trail'

gem 'hoptoad_notifier'

# Upload files to amazon S3
gem 'fog'
gem 'carrierwave'
gem 'rmagick'

# Translate routes
gem 'rails-translate-routes'
gem 'http_accept_language'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# I18n using an external server
#gem 'copycopter_client'

group :production do
  gem 'unicorn'
  gem 'mysql2'
end

group :development do
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'mysql2'
end

group :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'capybara'
  gem 'turn'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'faker'
end

group :heroku do
  gem 'pg'
end
