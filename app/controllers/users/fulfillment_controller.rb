class Users::FulfillmentController < ApplicationController
  before_action :require_login

  def index
    my_order_items= OrderItem.where(product_id: current_user.products)
    
    @grouped_by_status = my_order_items.group_by { |item| item.order.order_state}

    my_orders = my_order_items.pluck(:order_id)

    my_orders = Order.where(id: my_orders)

    if params[:order_state] && params[:order_state] != ""
      my_orders = my_orders.where(order_state: params[:order_state])
    end

    @orders = my_orders

  end

  def show
    @order = Order.find(params[:id])
  end
end
