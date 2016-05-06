class ProductsController < ApplicationController

  def index
    @categories = Product.where.not(category: nil).uniq.pluck(:category).sort
    @merchants = User.joins(:products).uniq.sort

    scope = Product.order(name: :asc)

    if params[:category]
      scope = scope.where(category: params[:category])
    end

    if params[:merchant]
      scope = scope.where(user_id: params[:merchant])
    end

    @products = scope
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new(product_id: @product.id)
    @reviews = Review.where(product_id: @product.id)
  end

  def add_to_cart
    product = Product.find(params[:id])
    quantity = params[:quantity]
    if current_user || product.in_stock?
      current_order.add_product(product, quantity, session[:order_id])
      redirect_to order_path(session[:order_id])
    else
      flash[:notice] = "This product is out of stock. To order one please log in"
      redirect_to product

    end
  end

end
