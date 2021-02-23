class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|


      t.integer  :scheduled_delivery_date_id,            null: false, default: 0
      t.integer  :scheduled_delivery_time_id,            null: false, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
