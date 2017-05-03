class ApplicationController < ActionController::API

  def format_params
    string_to_created(params[:created_at]) if params[:created_at]
    string_to_updated(params[:updated_at]) if params[:updated_at]
    string_to_unit_price(params[:unit_price]) if params[:unit_price]
  end

  def string_to_created(date)
    params.merge!(created_at: DateTime.parse(date))
  end

  def string_to_updated(date)
    params.merge!(updated_at: DateTime.parse(date))
  end

  def penny_converter(price)
    (price.to_f * 100).ceil
  end

  def string_to_unit_price(price)
    params.merge!(unit_price: penny_converter(price))
  end

end
