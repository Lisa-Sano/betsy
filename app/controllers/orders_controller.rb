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
    @order = Order.find_by(id: session[:order_id])
    @order.assign_attributes(order_update_params[:order])
    @order.assign_attributes(order_state: "paid")
    @order.last_four_cc = params[:order][:last_four_cc][-4..-1]
    if @order.save
      reset_cart
      render :order_confirmation
    else
      @user = User.find_by(id: session[:user_id])
      render :edit
    end
  end

  private

  def order_update_params
    params.permit(order: [:name, :email, :address, :city, :state, :zip, :card_name, :cc_cvv, :billing_zip, :cc_exp_month, :cc_exp_year])
  end
end
