class ApplicationController < ActionController::API

  helper_method :format_find_params

  def format_find_params(params)
    if params[:created_at]
      string_to_created(params[:created_at])
    elsif params[:updated_at]
      string_to_updated(params[:updated_at])
    elsif params[:unit_price]
      string_to_unit_price(params[:unit_price])
    else
      params
    end
  end

  def string_to_created(date)
    {created_at: DateTime.parse(date)}
  end

  def string_to_updated(date)
    {updated_at: DateTime.parse(date)}
  end

  def penny_converter(price)
    (price.to_f * 100).ceil
  end

  def string_to_unit_price(price)
    {unit_price: penny_converter(price)}
  end

end
