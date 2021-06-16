class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :payment_method
      t.integer :total_price
      t.string :recieve_name
      t.string :address
      t.string :postcode
      t.integer :order_status

      t.timestamps
    end
  end
end
