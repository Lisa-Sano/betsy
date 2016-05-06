class OrdersController < ApplicationController

  # create_table "orders", force: :cascade do |t|
  #   t.string   "order_state", null: false
  #   t.integer  "user_id"
  #   t.integer  "total"
  #   t.datetime "created_at",  null: false
  #   t.datetime "updated_at",  null: false
  #
  def index
    @orders_i_have_sold = Order.where(user_id: session[:user_id])
  end
  def show
    @order = Order.find_by(id: session[:order_id])
    render :show
    #must show all order items in cart
    #must give editing option (delete & change quantity of items in cart) I think a form for each order item, AND for each order would suffice.
  end

  def update
    @order = Order.find_by(id: session[:order_id])
    render :update
  end
end
