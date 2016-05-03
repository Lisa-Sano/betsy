class RemoveOrderItemsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_items, :integer
  end
end
