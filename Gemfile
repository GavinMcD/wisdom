source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development do
    gem 'webbynode'                     # Recommended hosting provider.
end

group :development, :test do
  gem 'rspec-rails'                     # Use rspec to do our integration tests.
  gem 'factory_girl_rails'              # Factory girls makes it easy to mock objects for our tests.
  gem 'capybara'                        # Capybara lets us drive our integration tests via headless browser.
  gem 'launchy'                         # Launchy let's us launch the current state of the app in the browser if we need to diagnose.
  gem 'database_cleaner'                # Necessary for undoing transactions in the database during our integration tests.
  gem 'sqlite3'                         
  gem 'evergreen', :require => 'evergreen/rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
end