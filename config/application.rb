require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bbsttr
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :test_unit, fixture: false

    end
    # config.time_zone = 'Brasilia'
    # config.active_record.default_timezone = :utc
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.exceptions_app = self.routes

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
  end
end
