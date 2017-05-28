module LatoMedia
  class Engine < ::Rails::Engine
    isolate_namespace LatoMedia

    require 'rubygems'
    require 'paperclip'

    # add routes support
    initializer 'Add gem routes to application', before: :load_config_initializers do
      Rails.application.routes.append do
        mount LatoMedia::Engine, at: '/lato/media'
      end
    end

  end
end
