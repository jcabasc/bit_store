source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.6'

# Database
gem 'mysql2', '~> 0.3.18'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'


source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '~> 3.1.0'
end

# App
gem 'decent_exposure'
gem 'active_model_serializers', '0.9.3'

gem 'jquery-rails'
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'web-console', '~> 2.0', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug'
  gem 'fabrication'
  gem 'faker'
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end

gem 'rails_12factor', group: :production
