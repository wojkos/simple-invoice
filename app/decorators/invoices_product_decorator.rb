# frozen_string_literal: true

class InvoicesProductDecorator < ApplicationDecorator
  delegate_all

  def total_with_currency
    "$#{number_with_precision(object.total_price, precision: 2, delimiter: ' ')}"
  end
end
