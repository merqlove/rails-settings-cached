module RailsSettings
  module Adapters
    module Mongoid
      module Extend
        extend ActiveSupport::Concern

        include ::RailsSettings::Adapters::Abstract::Extend

        included do
        end
      end
    end
  end
end
