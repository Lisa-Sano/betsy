class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_state, null: false
      # user_id here meaning buyer_id
      t.integer :user_id, null: false
      t.integer :order_items, null: false
      t.integer :total
      t.timestamps null: false
    end
  end
end
