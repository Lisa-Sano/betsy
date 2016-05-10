class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: session[:order_id])
    render :show
  end

  def edit
    @order = Order.find_by(id: session[:order_id])
    @user = User.find_by(id: session[:user_id])
    render :edit
  end

  def update
    order = Order.find_by(id: session[:order_id])
    order.update(order_state: "paid", user_id: current_user.id)
    reset_cart
    render :order_confirmation
  end
end
