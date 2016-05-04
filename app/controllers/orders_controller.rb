class OrdersController < ApplicationController

  def show
    @order = OrderItem.find_by(current_user)
    render :index
    #must show all order items in cart
    #must give editing option (delete & change quantity of items in cart) I think a form for each order item, AND for each order would suffice.
  end

  def new
    if @order = Order.find_by(user_id: current_user) != nil

    #RENDER INDEX??? Redirect around to whole cart. There is no form to fill out.
    #Makes a new "cart"
    #Has status of pending
    #Has at least one item && item must have an "order quantity" of at least 1.
  end
end
