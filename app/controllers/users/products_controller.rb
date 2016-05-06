class Users::ProductsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @categories = Product.where.not(category: nil).uniq.pluck(:category).sort
    scope = Product.where(user_id: params[:user_id])

    if params[:category]
      scope = scope.where(category: params[:category])
    end

    @products = scope
  end

  def show
    @product = Product.find(params[:id])
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

  def update
    Product.update(params[:id], products_params[:product])
    redirect_to user_product_path(session[:user_id], params[:id])
  end

  private

  def products_params
    params.permit(product: [:name, :description, :price, :photo_url, :stock])
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  def current_user_is_owner
    unless session[:user_id] == params[:user_id]
      flash[:error] = "You do not have access to that account"
      redirect_to user_products_path(session[:user_id])
    end
  end
end
