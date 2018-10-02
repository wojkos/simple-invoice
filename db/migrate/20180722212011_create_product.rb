class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :price, null: true, precision: 8, scale: 2
      t.timestamps
    end
  end
end
