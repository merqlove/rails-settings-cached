module RailsSettings
  module Adapters
    module ActiveRecord
      extend ActiveSupport::Concern

      autoload :Adapter, 'rails-settings/adapters/active_record/adapter'
      autoload :Extend, 'rails-settings/adapters/active_record/extend'
      autoload :Initializer, 'rails-settings/adapters/active_record/initializer'
      autoload :Settings, 'rails-settings/adapters/active_record/settings'

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

RailsSettings.send(:include, RailsSettings::Adapters::ActiveRecord)
