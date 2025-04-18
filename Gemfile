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

# Deployment
# Use Figaro to handle app secrets
gem 'figaro'

# Backend functionality
# Authentication
gem 'devise'
# Authorization
gem 'cancancan', '~> 2.0'
# Responders to dry out controllers
gem 'responders'
# Money attributes in models
gem 'money-rails', '~> 1'
# Refile to handle file storage
gem 'refile', github: 'refile/refile', require: 'refile/rails'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
# acts_as_list to handle user sorting
gem 'acts_as_list'

# Frontend functionality
# Use jquery for bootstrap components
gem 'jquery-rails'
# Use bootstrap confirmation modals
gem 'data-confirm-modal'

# Styling
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstrap for styles
gem 'bootstrap', '~> 4.1.1'
# Use font-awesome icons
gem 'font-awesome-rails'

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
  # Intercepting mail
  gem 'letter_opener'
  # Code style
  # ruby linter
  gem 'rubocop', require: false
  # haml linter
  gem 'haml-lint', require: false

  # Unit testing
  # Use RSpec for testing
  gem 'rspec-rails', '~> 3.5'
  # Use Capybara for feature testing
  gem 'capybara'
  # Auto run RSpec tests
  gem 'guard-rspec', '~> 4.7'
  # Test controller assignments
  gem 'rails-controller-testing'
  # Use Factory Bot to replace fixtures with factories
  gem 'factory_bot_rails'
  # Use Faker to generate test and development data
  gem 'faker'
end

group :development do
  # Speed up development
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Debugging
  gem 'web-console', '>= 3.3.0'
end
