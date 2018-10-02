# frozen_string_literal: true

require 'rails_helper'

feature 'User create invoice' do
  before(:all) do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'adding product create invoice' do
    visit root_path
    expect(Invoice.count).to eq(0)
    find(:xpath, '(//form/input)[1]').click
    find(:xpath, '(//form/input)[2]').click
    expect(Invoice.count).to eq(1)
  end

  scenario 'closing invoice create name' do
    visit root_path
    expect(Invoice.count).to eq(0)
    find(:xpath, '(//form/input)[1]').click
    visit new_checkout_path
    expect(Invoice.last.name).to eq(nil)
    click_link('Close invoice')
    expect(Invoice.last.name).not_to eq(nil)
  end

  scenario 'after closing invoice adding item create new invoice' do
    visit root_path
    find(:xpath, '(//form/input)[1]').click
    expect(Invoice.count).to eq(1)
    visit new_checkout_path
    invoice_id = Invoice.last.id
    click_link('Close invoice')
    visit root_path
    find(:xpath, '(//form/input)[1]').click
    expect(Invoice.count).to eq(2)
    expect(Invoice.last.id).not_to eq(invoice_id)
  end

  scenario 'adding products change quantity and total_price' do
    visit root_path
    find(:xpath, '(//form/input)[1]').click
    expect(Invoice.last.total_price.to_f).to eq(99.99)
    expect(Invoice.last.invoices_product[0].quantity).to eq(1)
    find(:xpath, '(//form/input)[1]').click
    expect(Invoice.last.total_price.to_f).to eq(199.98)
    expect(Invoice.last.invoices_product[0].quantity).to eq(2)
  end

  scenario 'Substracting items should change count of item in invoice
    and destroy item if count equals zero.' do
    visit root_path
    find(:xpath, '(//form/input)[1]').click
    find(:xpath, '(//form/input)[2]').click
    find(:xpath, '(//form/input)[2]').click
    current_invoice = Invoice.last
    expect(current_invoice.invoices_product.count).to eq(2)
    expect(current_invoice.invoices_product[1].quantity).to eq(2)
    visit invoice_path(current_invoice.id)
    find(:xpath, '(//input[@value="-"])[2]').click
    current_invoice = Invoice.last
    expect(current_invoice.invoices_product.count).to eq(2)
    expect(current_invoice.invoices_product[1].quantity).to eq(1)
    find(:xpath, '(//input[@value="-"])[2]').click
    current_invoice = Invoice.last
    expect(current_invoice.invoices_product.count).to eq(1)
  end
end
