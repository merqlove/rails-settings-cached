module RailsSettings
  module Adapters
    module Mongoid
      extend ActiveSupport::Concern

      autoload :Adapter, 'rails-settings/adapters/mongoid/adapter'
      autoload :Extend, 'rails-settings/adapters/mongoid/extend'
      autoload :Initializer, 'rails-settings/adapters/mongoid/initializer'
      autoload :ScopedSettings, 'rails-settings/adapters/mongoid/scoped_settings'
      autoload :Settings, 'rails-settings/adapters/mongoid/settings'

      included do
        BaseAdapter = Module.new do
          def self.[](value) 
            base_adapter[value]
          end

          def self.base_adapter
            @base_adapter ||= Adapter.new
          end
        end

        include BaseAdapter[:initializer]
      end
    end
  end
end

RailsSettings.send(:include, RailsSettings::Adapters::Mongoid)
