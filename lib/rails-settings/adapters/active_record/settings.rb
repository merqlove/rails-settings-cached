module RailsSettings
  module Adapters
    module ActiveRecord
      class Settings < ::ActiveRecord::Base
        self.table_name = table_name_prefix + 'settings'

        include ::RailsSettings::Adapters::Abstract::Settings

        class << self
          # retrieve all settings as a hash (optionally starting with a given namespace)
          def get_all(starting_with = nil)
            vars = thing_scoped.select('var, value')
            vars = vars.where("var LIKE '#{starting_with}%'") if starting_with
            result = {}
            vars.each { |record| result[record.var] = record.value }
            result.reverse_merge!(default_settings(starting_with))
            result.with_indifferent_access
          end

          def where(sql = nil)
            vars = thing_scoped.where(sql) if sql
            vars
          end

          def object(var_name)
            return nil unless rails_initialized?
            return nil unless table_exists?
            thing_scoped.where(var: var_name.to_s).first
          end

          def thing_scoped
            unscoped.where('thing_type is NULL and thing_id is NULL')
          end
        end
      end
    end
  end
end
