class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer    :quantity,      null: false
      t.references :product,       foreign_key: true
      t.references :order,         foreign_key: true
      t.timestamps
    end
  end
end
