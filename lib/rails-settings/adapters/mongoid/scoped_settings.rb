module RailsSettings
  module Adapters
    module Mongoid
      class ScopedSettings < ::RailsSettings::Base
        def self.for_thing(object)
          @object = object
          self
        end

        def self.thing_scoped
          unscoped.where(thing_type: @object.class.base_class.to_s, thing_id: @object.id)
        end
      end
    end
  end
end
