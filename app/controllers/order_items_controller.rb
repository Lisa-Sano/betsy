class OrderItemsController < ApplicationController
  before_action :require_login, only: [:show]
  def show
    @item = OrderItem.find(params[:id])
  end

  def update
    @item = OrderItem.find(params[:id])
    @item.update(update_quantity)
    redirect_to user_order_path(session[:user_id], session[:order_id])
  end

  def destroy
    OrderItem.destroy(params[:id])
    redirect_to user_order_path(session[:user_id], session[:order_id])
  end

  private

  def update_quantity
    params.require(:order_item).permit(:quantity)
  end
end
