class MoveColumnsFromOrderItemToOrder < ActiveRecord::Migration
  def change
    remove_column :order_items, :tracking_info, :string
    remove_column :order_items, :carrier_code, :string
    remove_column :order_items, :shipping_cost, :decimal
    add_column :orders, :tracking_info, :string
    add_column :orders, :carrier_code, :string
    add_column :orders, :shipping_cost, :decimal
  end
end
