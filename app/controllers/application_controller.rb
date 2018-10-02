# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def current_invoice
    Invoice.find(session[:invoice_id])
  rescue ActiveRecord::RecordNotFound
    invoice = Invoice.find_by(closed: false)
    invoice ||= Invoice.create
    session[:invoice_id] = invoice.id
    invoice
  end
end
