require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cormacksdesk
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end

  def desk
    @client ||= DeskApi::Client.new({
      token: 'cF5C9Fuv3DlGU5g1rB8P',
      token_secret: 'UXH0fuSpi1idCqISrP4QVE6nvuwC4sCdGOPnDwWD',
      consumer_key: 'wYGw0UEkmbHFLtFgCWmU',
      consumer_secret: 'egJdds0TvXssfWKHe9MUVNIFvxIgo16rPLXoJECL',
      subdomain: 'pcconsulting'
    })
  end
end
