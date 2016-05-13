class OrderItemsController < ApplicationController
  before_action :require_login, only: [:show]
  def show
    @item = OrderItem.find(params[:id])
  end

  def update
    @item = OrderItem.find(params[:id])
    @item.update(update_quantity)
    redirect_to order_path(session[:order_id])
  end

  def destroy
    OrderItem.destroy(params[:id])
    order = Order.find(session[:order_id])
    if order.order_items.empty?
      reset_cart
      redirect_to products_path
    else
      redirect_to order_path(session[:order_id])
    end
  end

  private

  def update_quantity
    params.require(:order_item).permit(:quantity)
  end
end
