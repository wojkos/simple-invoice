class CreateInvoice < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :name, unique: true
      t.boolean :closed, default: false
      t.timestamps
    end
  end
end
