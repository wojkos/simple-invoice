# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_invoice, only: %i[new create]

  def new; end

  def create
    @invoice.generate_name
    @invoice.closed = true
    @invoice.save
    reset_session
    respond_to do |format|
      format.html { redirect_to(root_path, notice: 'Invoice created!') }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(session[:invoice_id])
  end
end
