require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

require 'fog/aws'
require 'rack/mobile-detect'
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FirmwareManagementSystem
  class Application < Rails::Application
    console do
      ActiveRecord::Base.connection
    end

    config.api_only = true

    config.autoload_paths << Rails.root.join('lib')

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use Rack::Attack
    config.middleware.use Rack::MethodOverride
    config.middleware.use Rack::MobileDetect
  end
end
