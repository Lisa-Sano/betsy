class Users::FulfillmentController < ApplicationController
  before_action :require_login

  def index
    @products_i_sell = Product.where(user_id: current_user)
    @my_order_items = OrderItem.where(product_id: @products_i_sell)
    @total_revenue = @my_order_items.map { |item| item.product.price }.sum
    @grouped_by_status = @my_order_items.group_by { |post| post.order.order_state}
    @grouped_by_order = @my_order_items.group_by { |post| post.order.id}
    @my_orders = @grouped_by_order.keys

    scope = Order.where(id: @my_orders)

    if params[:order_state] && params[:order_state] != ""
      scope = scope.where(order_state: params[:order_state])
    end

    @orders = scope

  end

  def show
    @order = Order.find(params[:id])
  end
end
