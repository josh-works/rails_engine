include ActionView::Helpers::NumberHelper

module RailsEngine
  module FormatHelpers
    def format_unit_price(price = unit_price)
      number_to_currency(price/100.00, precision: 2, unit: "", delimiter: '')
    end
  end
end
