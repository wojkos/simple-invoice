# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_many :invoices_product, dependent: :restrict_with_exception

  scope :from_this_month, lambda {where(created_at: Time.zone.now.beginning_of_month..(Time.zone.now.end_of_month))}

  def add_product(product_id)
    current_product = invoices_product.find_by(product_id: product_id)
    if current_product
      current_product.quantity += 1
    else
      current_product = invoices_product.build(product_id: product_id)
    end
    current_product
  end

  def product_substraction(product_id)
    current_product = invoices_product.find_by(product_id: product_id)
    if current_product.quantity >= 2
      current_product.quantity -= 1
      current_product
    else
      current_product.destroy
    end
  end

  def total_price
    invoices_product.to_a.sum(&:total_price)
  end

  def generate_name
    year = Time.current.year
    month = Time.current.strftime('%m')
    last_invoice = Invoice.from_this_month.where(closed: true).last
    if last_invoice
      next_number = last_invoice.name[-2, 2].to_i + 1
      if next_number < 10
        next_number = "0#{next_number}"
      end
      self.name = "#{year}/#{month}/#{next_number}"
    else
      self.name = "#{year}/#{month}/01"
    end
  end
end
