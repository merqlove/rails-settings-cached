module RailsSettings
  module Adapters
    module Mongoid
      class Adapter
        attr_reader :modules

        def initialize
          @modules = {
            initializer: Initializer,
            extend: Extend,
            settings: Settings
          }
        end

        # get a module by [] notation
        def [](value)
          @modules[value]
        end
      end
    end
  end
end
