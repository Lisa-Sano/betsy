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

  #this method is only used for inserting customer billing info
  def update
    @order = Order.find_by(id: session[:order_id])
    @order.assign_attributes(order_update_params[:order])
    @order.last_four_cc = params[:order][:last_four_cc][-4..-1]

    if @order.save
      @user = User.find_by(id: session[:user_id])
      render :shipping
    else
      @user = User.find_by(id: session[:user_id])
      render :edit
    end
  end

  #may need separate confirmation method to finalize checkout
  #this method is only used after customer has chosen shipping method
  def confirmation
    @order = Order.find_by(id: session[:order_id])
    @order.assign_attributes(order_update_params[:order])

    #updates status if shipping info exists(after order confirmation)
    @order.assign_attributes(order_state: "paid") if params[:order][:carrier_code] != nil


    if @order.save && params[:order][:carrier_code] != nil
      reset_cart
      render :order_confirmation
  end

  private

  def order_update_params
    params.permit(order: [:name, :email, :address, :city, :state, :zip, :card_name, :cc_cvv, :billing_zip, :cc_exp_month, :cc_exp_year, :tracking_info, :carrier_code, :shipping_cost])
  end
end
