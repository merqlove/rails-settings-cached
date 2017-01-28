require 'rails-settings/adapters/active_record' if defined? ActiveRecord
require 'rails-settings/adapters/mongoid'       if defined? Mongoid

require_relative 'rails-settings/base'
require_relative 'rails-settings/cached_settings'
require_relative 'rails-settings/default'
require_relative 'rails-settings/extend'
require_relative 'rails-settings/railtie'
require_relative 'rails-settings/version'

module RailsSettings
end
