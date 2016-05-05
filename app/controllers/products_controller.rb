class ProductsController < ApplicationController
  def index
    @categories = Product.uniq.pluck(:category).sort
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
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_order.add_product(@product)
  end
end
