class CreateInvoiceProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices_products do |t|
      t.references :product, foreign_key: true
      t.belongs_to :invoice, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
