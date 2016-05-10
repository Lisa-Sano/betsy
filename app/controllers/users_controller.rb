class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: @user.id)
    @products = Product.where(user_id: @user.id)
    @order_item = OrderItem.where(user_id: @user.id)
    @reviews = Review.where(user_id: @user.id)
  end

  def edit
    @user = User.find(session[:user_id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    @order = Order.find(session[:order_id])
    @user.update(user_create_params[:user])
    redirect_to edit_user_order_path(@user.id, @order.id)
  end

  private

  def user_create_params
    params.permit(user: [:user_name, :name, :email, :password, :password_confirmation, :address, :city, :state, :zip, :card_name, :cc_exp, :cc_cvv, :billing_zip, :last_four_cc])
  end
end
