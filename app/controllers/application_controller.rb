class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def current_order
    order ||= Order.find_by(id: session[:order_id])
    if order.nil?
      order = Order.create(order_state: "pending")
      session[:order_id] = order.id
    end

    return order
  end
end
