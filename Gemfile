source 'https://rubygems.org'

# Ruby
ruby '2.5.0'
# Rails
gem 'rails', '~> 5.1.4'
# postgresql Database
gem 'pg', '~> 0.18'
# Puma app server
gem 'puma', '~> 3.7'
# Sidekiq workers (uses Redis)
gem 'sidekiq'

# Backend functionality
# Authentication
gem 'devise'

# Frontend functionality
# Use jquery for bootstrap components
gem 'jquery-rails'

# Styling
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstrap for styles
gem 'bootstrap', '~> 4.0.0'

# Views
# Use haml for views
gem 'haml-rails', '~> 1.0'
# Use jbuilder for json responses
gem 'jbuilder', '~> 2.5'
# Use Turbolinks for improved navigation
gem 'turbolinks', '~> 5'
# Use webpack to bundle javascript
gem 'webpacker', '~> 3.0'

# Mailing
# Use premailer to style emails
gem 'premailer-rails'

group :development, :test do
  # Debugging
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Speed up development
  gem 'spring'

  # Debugging
  gem 'web-console', '>= 3.3.0'

  # Unit testing
  # Use RSpec for testing
  gem 'rspec-rails', '~> 3.5'
  # Auto run RSpec tests
  gem 'guard-rspec', '~> 4.7'
  # Test controller assignments
  gem 'rails-controller-testing'
  # Use Factory Bot to replace fixtures with factories
  gem 'factory_bot_rails'
  # Use Faker to generate test and development data
  gem 'faker'
end
