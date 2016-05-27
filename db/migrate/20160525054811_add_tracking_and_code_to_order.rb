class AddTrackingAndCodeToOrder < ActiveRecord::Migration
  def change
    add_column :order_items, :tracking_info, :string
    add_column :order_items, :carrier_code, :string
  end
end
