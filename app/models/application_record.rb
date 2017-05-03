require 'rails_engine/format_helpers'

class ApplicationRecord < ActiveRecord::Base
  include RailsEngine::FormatHelpers

  self.abstract_class = true
end
