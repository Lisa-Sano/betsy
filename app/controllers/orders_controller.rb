class OrdersController < ApplicationController

  def show
    @cart = OrderItem.where(order_id: session[:order_id])
    render :show
    #must show all order items in cart
    #must give editing option (delete & change quantity of items in cart) I think a form for each order item, AND for each order would suffice.
  end
end
