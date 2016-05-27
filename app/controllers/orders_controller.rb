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
    if @order.save && displayrates
      render :displayrates
    else
      @user = User.find_by(id: session[:user_id])
      render :edit
    end
  end

  def displayrates
    @order = Order.find_by(id: session[:order_id])
    info = {:order => {}}
    info[:order][:state] = @order.state
    info[:order][:city] = @order.city
    info[:order][:zip] = @order.zip

    info[:order][:origin]= { state: "WA", zip: 98112, city: "Seattle" }
    info[:order][:orderitems] = @order.hashify
    @params = info.to_json


    @results = HTTParty.post("http://shippingapi.herokuapp.com/shipping/rates",
    :body => @params,
     :headers => { 'Content-Type' => 'application/json' }
    )
    if @results.code > 200
      @error = @results.parsed_response["error"]
      return false
    end

    return true
  end

  def updateshipping
    info_array = params["order"]["shipping_method"].split
    cost = (info_array.pop).to_i
    method = info_array.join(' ')

    @order = Order.find_by(id: session[:order_id])
    @order.update(shipping_method: method, shipping_cost: cost)
    @cost_with_shipping = @order.order_total + @order.shipping_cost
    @order.update(total: @cost_with_shipping)
    reset_cart
    render :order_confirmation
  end

  private

  def order_update_params
    params[:order][:total] = @order.order_total
    params.permit(order: [:name, :email, :total, :address, :city, :state, :zip, :card_name, :cc_cvv, :billing_zip, :cc_exp_month, :cc_exp_year])
  end
end
