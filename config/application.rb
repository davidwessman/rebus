require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rebus
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales',
                                                 '**', '*.yml')]
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = %i[sv en]
    config.i18n.default_locale = :sv
    config.time_zone = 'Stockholm'

    config.generators do |g|
      g.scaffold_stylesheet false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_unit false
      g.resource_route false
    end
  end
end
