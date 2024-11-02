require_relative "boot"

require "rails/all"

ENV["RANSACK_FORM_BUILDER"] = "::SimpleForm::FormBuilder"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsProject65
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2
    config.i18n.default_locale = :ru
    config.active_storage.variant_processor = :mini_magick

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_view.sanitized_allowed_tags = %w[
    strong em b i p code pre tt samp kbd var sub sup dfn cite big small address
    hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img
    blockquote del ins table tr td th thead tbody tfoot
]

    config.action_view.sanitized_allowed_attributes = %w[
    href src width height alt cite datetime title class name xml:lang abbr style
    target rel data-method data-confirm
]

  end
end
