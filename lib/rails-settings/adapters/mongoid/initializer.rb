module RailsSettings
  module Adapters
    module Mongoid
      module Initializer
        extend ActiveSupport::Concern

        included do
          Settings.after_create :rewrite_cache
          Settings.after_update :rewrite_cache
          Settings.after_destroy :expire_cache
        end
      end
    end
  end
end
