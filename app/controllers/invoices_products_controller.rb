# frozen_string_literal: true

class InvoicesProductsController < ApplicationController
  def index; end

  def create
    @invoice = current_invoice
    if params[:code]
      product = Product.find_by(code: params[:code])
    else
      product = Product.find(params[:product_id])
    end
    if product
      if params[:decrease].nil?
        @invoice_product = @invoice.add_product(product.id)
        notice = 'Product added'
      else
        @invoice_product = @invoice.product_substraction(product.id)
        notice = 'Product removed'
      end
      respond_to do |format|
        if @invoice_product.save
          format.html { redirect_to(request.referer, notice: notice.to_s) }
          format.js
        else
          format.html { render action: 'new' }
        end
        session[:current_invoice_value] = @invoice.total_price
      end
    else
      respond_to do |format|
        format.html { redirect_to(request.referer, alert: 'Wrong product code') }
      end
    end
  end

  def update
    # TODO
  end
end
