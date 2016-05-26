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
      # reset_cart
      displayrates
      render :displayrates

    else
      @user = User.find_by(id: session[:user_id])
      render :edit
    end
  end

  def displayrates
    @order = Order.find_by(id: session[:order_id])
    params[:order][:state] = @order.state
    params[:order][:city] = @order.city
    params[:order][:zip] = @order.zip

    params[:order][:origin]= { state: "WA", zip: 98112, city: "Seattle" }
    params[:order][:orderitems] = @order.hashify
    @params = params.to_json


    @results = HTTParty.post("http://localhost:3000/shipping/rates",
    :body => @params,
     :headers => { 'Content-Type' => 'application/json' }
    )
  end

  def updateshipping
    info_array = params["order"]["shipping_method"].split
    cost = (info_array.pop).to_i
    method = info_array.join

    @order = Order.find_by(id: session[:order_id])
    @order.update(shipping_method: method, shipping_cost: cost)
    @cost_with_shipping = @order.total + @order.shipping_cost
    @order.update(total: @cost_with_shipping)
    render :order_confirmation
  end

  private

  def order_update_params
    params[:order][:total] = @order.order_total
    params.permit(order: [:name, :email, :total, :address, :city, :state, :zip, :card_name, :cc_cvv, :billing_zip, :cc_exp_month, :cc_exp_year])
  end
end
