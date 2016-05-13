class ProductsController < ApplicationController

  def index
    @categories = Category.order(name: :asc)
    @merchants = User.joins(:products).uniq.sort

    scope = Product.where(retired: false).order(name: :asc)

    if params[:category].present?
      scope = scope.joins(:categories).where(categories: {id: params[:category]})
    end

    if params[:merchant].present?
      scope = scope.where(user_id: params[:merchant])
    end

    @products = scope
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new(product_id: @product.id)
    @reviews = Review.where(product_id: @product.id)
    @categories = @product.categories
  end

  def  search
    product_names = Product.all.pluck(:name)
    result = product_names.select do |name|
      name.include? params[:q].capitalize
    end

    @products = Product.where(name: result)

    if @products == []
    flash[:notice] = "No matches for #{params[:q]} found "
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    quantity = params[:quantity]
    if current_user || product.in_stock?
      current_order.add_product(product, quantity, session[:order_id])
      redirect_to order_path(session[:order_id]), method: :get
    else
      flash[:notice] = "This product is out of stock. To order one please log in"
      redirect_to product
    end
  end
end
