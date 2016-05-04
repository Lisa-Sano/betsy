class ProductsController < ApplicationController
  def index
    @categories = Product.uniq.pluck(:category).sort

    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = Product.order(name: :asc)
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new(product_id: @product.id)
  end
end
