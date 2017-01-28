module RailsSettings
  module Adapters
    module Mongoid
      class Settings
        include ::Mongoid::Document
        include ::RailsSettings::Adapters::Abstract::Settings

        store_in collection: 'settings'

        field :var, type: String
        field :value, type: String

        class << self
          # retrieve all settings as a hash (optionally starting with a given namespace)
          def get_all(starting_with = nil)
            vars = thing_scoped.only(:var, :value)
            vars = vars.where(var: Regexp.new("^#{starting_with}")) if starting_with
            result = {}
            vars.each { |record| result[record.var] = record.value }
            result.reverse_merge!(default_settings(starting_with))
            result.with_indifferent_access
          end

          def where(query = nil)
            vars = thing_scoped.where(query) if query
            vars
          end

          def object(var_name)
            return nil unless rails_initialized?
            thing_scoped.where(var: var_name.to_s).first
          end

          def thing_scoped
            unscoped.and(thing_type: nil, thing_id: nil)
          end
        end
      end
    end
  end
end
