module RailsSettings
  module Adapters
    module Abstract
      autoload :Settings, 'rails-settings/adapters/abstract/settings'
      autoload :Extend, 'rails-settings/adapters/abstract/extend'
      autoload :ScopedSettings, 'rails-settings/adapters/abstract/scoped_settings'
    end
  end
end
