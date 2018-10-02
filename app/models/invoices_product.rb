# frozen_string_literal: true

class InvoicesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :invoice, touch: true

  # TODO
  def total_price
    product.price * quantity
  end
end
