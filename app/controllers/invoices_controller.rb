# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all.decorate

    respond_to do |format|
      format.html
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id]).decorate
  rescue ActiveRecord::RecordNotFound
    redirect_to products_url, alert: 'Invalid invoice'
  else
    respond_to do |format|
      format.html
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find_by(id: :id)
  end
end
