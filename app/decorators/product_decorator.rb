# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all

  def price_with_currency
    "$#{number_with_precision(price, precision: 2, delimiter: ' ')}"
  end
end
