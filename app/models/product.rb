# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :invoices_product, dependent: :restrict_with_exception
  validates :code, presence: true, length: {minimum: 1}
  validates :code, uniqueness: true
  validates :name, presence: true, length: {minimum: 1}
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  before_destroy :ensure_not_referenced_by_any_invoice_products

  private

  # ensure that there are no invoices products referencing this product
  def ensure_not_referenced_by_any_invoice_products
    if invoice_products.empty?
      true
    else
      errors.add(:base, 'Invoice products present')
      false
    end
  end
end
