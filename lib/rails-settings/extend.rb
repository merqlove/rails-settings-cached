module RailsSettings
  module Extend
    extend ActiveSupport::Concern

    included do 
      include ::RailsSettings::BaseAdapter[:extend]
    end
  end
end
