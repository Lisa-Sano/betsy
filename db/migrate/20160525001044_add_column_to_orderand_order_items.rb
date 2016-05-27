class AddColumnToOrderandOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :shipping_cost, :decimal

  end
end
