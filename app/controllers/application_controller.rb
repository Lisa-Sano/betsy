class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_order

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def current_order
    # check if an order is already stored in the session
    order ||= Order.find_by(id: session[:order_id])

    # if no order exists, create a new one and store its id in sessions hash
    if order.nil?
      order = Order.create(order_state: "pending")
      session[:order_id] = order.id
    end

    # return the instance of order
    return order
  end
end
