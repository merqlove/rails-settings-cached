module RailsSettings
  module Adapters
    module ActiveRecord
      module Extend
        extend ActiveSupport::Concern

        include ::RailsSettings::Adapters::Abstract::Extend

        included do
          scope :with_settings, lambda {
            joins("JOIN settings ON (settings.thing_id = #{table_name}.#{primary_key} AND
                                     settings.thing_type = '#{base_class.name}')")
              .select("DISTINCT #{table_name}.*")
          }

          scope :with_settings_for, lambda { |var|
            joins("JOIN settings ON (settings.thing_id = #{table_name}.#{primary_key} AND
                                     settings.thing_type = '#{base_class.name}') AND settings.var = '#{var}'")
          }

          scope :without_settings, lambda {
            joins("LEFT JOIN settings ON (settings.thing_id = #{table_name}.#{primary_key} AND
                                          settings.thing_type = '#{base_class.name}')")
              .where('settings.id IS NULL')
          }

          scope :without_settings_for, lambda { |var|
            where('settings.id IS NULL')
              .joins("LEFT JOIN settings ON (settings.thing_id = #{table_name}.#{primary_key} AND
                                           settings.thing_type = '#{base_class.name}') AND settings.var = '#{var}'")
          }
        end
      end
    end
  end
end
