require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.time_zone                       = 'Brasilia'
    config.i18n.default_locale             = :'pt-BR'
    config.i18n.load_path                 += Dir[Rails.root.join("config/locales/**/*.yml").to_s]

    config.i18n.enforce_available_locales  = true
    I18n.enforce_available_locales         = true

    config.encoding = "utf-8"

    config.assets.paths << "#{Rails.root}/app/assets/fonts"
  end
end
