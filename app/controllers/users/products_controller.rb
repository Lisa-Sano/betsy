class Users::ProductsController < ApplicationController
  def index

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params[:product])
    @product.price = @product.to_cents(params[:product][:price])
    @product.user_id = session[:user_id]
    if @product.save
      redirect_to user_products_path(session[:user_id])
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def products_params
    params.permit(product: [:name, :description, :price, :photo_url, :stock])
  end
end
