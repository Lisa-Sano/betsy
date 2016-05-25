class AddShippingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_method, :string
    add_column :orders, :shipping_cost, :real

  end
end
