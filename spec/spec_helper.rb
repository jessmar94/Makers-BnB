require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'features/web_helpers'
require 'bcrypt'

# Specify that this is a Test environment
ENV['RACK_ENV'] = 'test'
require_relative './database_helpers'

# Require our Sinatra app file, which in turn requires the model files
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Tell Capybara about our app class
Capybara.app = MakersBnB

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
