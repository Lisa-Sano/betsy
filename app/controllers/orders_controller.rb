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

    #saves last four of CC if passing through update the first time
    @order.last_four_cc = params[:order][:last_four_cc][-4..-1] if params[:order][:last_four_cc] != nil

    #updates status if shipping info exists(after order confirmation)
    @order.assign_attributes(order_state: "paid") if params[:order][:carrier_code] != nil

    if @order.save && params[:order][:carrier_code] != nil
      reset_cart
      render :order_confirmation
    elsif @order.save
      @user = User.find_by(id: session[:user_id])
      render :edit
    else
      @user = User.find_by(id: session[:user_id])
      render :edit
    end
  end

  private

  def order_update_params
    params.permit(order: [:name, :email, :address, :city, :state, :zip, :card_name, :cc_cvv, :billing_zip, :cc_exp_month, :cc_exp_year, :tracking_info, :carrier_code, :shipping_cost])
  end
end
