class ShippingsController < ApplicationController

  def getrates
    @order = Order.find_by(id: session[:order_id])
    params[:order][:origin]= { state: "WA", zip: 98112, city: "Seattle" }
    params[:order][:orderitems] = @order.hashify
    @params = params.to_json

    @results = HTTParty.post("http://localhost:3000/shipping/rates",
    :body => @params,
     :headers => { 'Content-Type' => 'application/json' }
    )
  end

  def displayrates
    render :test
  end

end
