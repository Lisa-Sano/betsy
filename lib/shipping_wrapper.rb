# require "httparty"
#
# module ShippingWrapper
#
#   def self.displayrates(params)
#     @order = Order.find_by(id: session[:order_id])
#     params[:order][:state] = @order.state
#     params[:order][:city] = @order.city
#     params[:order][:zip] = @order.zip
#
#     params[:order][:origin]= { state: "WA", zip: 98112, city: "Seattle" }
#     params[:order][:orderitems] = @order.hashify
#     @params = params.to_json
#
#
#     @results = HTTParty.post("http://localhost:3000/shipping/rates",
#     :body => @params,
#      :headers => { 'Content-Type' => 'application/json' }
#     )
#     if @results.code > 200
#       @error = @results.parsed_response["error"]
#       return false
#     end
#
#     return true
#   end
#
# end
