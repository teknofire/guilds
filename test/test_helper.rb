ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new({ 
          uid: '123456', info: { email: 'admin@test.com', name: 'Admin' } 
    })

    # Add more helper methods to be used by all tests here...
    def sign_in_admin
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:discord]
      get user_discord_omniauth_callback_path
    end
  end
end
