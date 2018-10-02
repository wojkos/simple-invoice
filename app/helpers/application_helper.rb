# frozen_string_literal: true

module ApplicationHelper
  def nice_currency(number)
    "$#{number_with_precision(number, precision: 2, delimiter: ' ')}"
  end
end
