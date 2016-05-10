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
  end

  def edit
    @order = Order.find_by(id: session[:order_id])
    @user = User.find_by(id: session[:user_id])
    render :edit
  end

  def update
    if @user.login? == false
      @user.save
    end
    
    @order.update(order_state: "paid", user_id: @user.id)
    render COMPLETED ORDER PAGE
  end
end
