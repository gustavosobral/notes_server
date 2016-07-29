ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

# The only database cleaner strategy possible for Mongoid.
DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  include FactoryGirl::Syntax::Methods

  # Decode response body into JSON format.
  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end
