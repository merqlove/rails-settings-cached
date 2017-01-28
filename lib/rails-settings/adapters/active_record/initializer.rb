module RailsSettings
  module Adapters
    module ActiveRecord
      module Initializer
        extend ActiveSupport::Concern

        included do
          Settings.after_commit :rewrite_cache, on: %i(create update)
          Settings.after_commit :expire_cache, on: %i(destroy)
        end
      end
    end
  end
end
