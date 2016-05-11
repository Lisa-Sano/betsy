class Users::FulfillmentController < ApplicationController
  before_action :require_login

  def index
    @grouped_by_status = OrderItem.where(product_id: current_user.products).group_by { |item| item.order.order_state}

    @grouped_by_order = OrderItem.where(product_id: current_user.products).group_by { |item| item.order.id}
    my_orders = @grouped_by_order.keys

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
