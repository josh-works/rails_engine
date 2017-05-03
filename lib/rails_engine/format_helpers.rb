include ActionView::Helpers::NumberHelper

module RailsEngine
  module FormatHelpers
    def format_unit_price
      number_to_currency(unit_price/100.00, precision: 2, unit: "")
    end
  end
end
