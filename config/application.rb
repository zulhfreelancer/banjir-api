require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module BanjirApi
  class Application < Rails::Application
    config.time_zone = 'Asia/Kuala_Lumpur'
    config.autoload_paths << Rails.root.join('lib')
    config.enable_dependency_loading = true

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  end
end
