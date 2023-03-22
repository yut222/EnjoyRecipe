require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnjoyRecipe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # 下記追記
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # デフォルトの言語設定
    config.i18n.default_locale = :ja
    config.add_autoload_paths_to_load_path = false
    config.autoload_paths += %W(#{config.root}/lib/validator)
    # 言語ファイルを階層ごとに設定するための記述
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      html_tag
    end
    config.generators do |g|
      g.test_framework :rspec,
                        view_specs: false,
                        helper_specs: false,
                        controller_specs: false,
                        routing_specs: false,
                        request_specs: false
    end
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

end
