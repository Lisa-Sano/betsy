class OrderItemsController < ApplicationController
  def update
    @item = OrderItem.find(params[:id])
    @item.update(update_quantity)
    redirect_to order_path(@item[:order_id])
  end

  def destroy
    redirect_order = OrderItem.find(params[:id]).order_id
    OrderItem.destroy(params[:id])
    redirect_to order_path(redirect_order)
  end

  private

  def update_quantity
    params.require(:order_item).permit(:quantity)
  end
end
