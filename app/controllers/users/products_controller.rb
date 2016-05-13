class Users::ProductsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :current_user_is_owner, only: [:new, :edit, :destroy]

  def index
    @categories = Category.order(name: :asc)

    scope = Product.where(user_id: params[:user_id], retired: false).order(name: :asc)

    if params[:category].present?
      scope = scope.joins(:categories).where(categories: {id: params[:category]})
    end

    @products = scope

    if User.my_account?(current_user, params[:user_id].to_i)
        @retired_products = Product.where(user_id: params[:user_id], retired: true).order(name: :asc)
        render action: :my_index
    else
        render action: :index
    end
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories

    if User.my_account?(current_user, params[:user_id].to_i)
        render action: :my_show
    else
        render action: :show
    end
  end

  def new
    @product = Product.new
    @categories = Category.order(name: :asc)
  end

  def create
    @product = Product.new(products_params[:product])
    @product.to_cents(params[:product][:price])
    @product.user_id = session[:user_id]
    @product.add_categories(params[:product][:categories][1..-1])
    if @product.save
      redirect_to user_products_path(session[:user_id])
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.order(name: :asc)
  end

  def update
    @product = Product.find(params[:id])
    Product.update(params[:id], products_params[:product])
    @product.to_cents(params[:product][:price])
    @product.add_categories(params[:product][:categories][1..-1])
    if @product.save
      redirect_to user_product_path(session[:user_id], params[:id])
    else
      flash.now[:error] = "There was an error updating your product. Please try again."
      render :edit
    end
  end

  private

  def products_params
    params.permit(product: [:name, :description, :photo_url, :stock, :retired])
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  def current_user_is_owner
    unless session[:user_id] == params[:user_id].to_i
      flash[:error] = "You do not have access to that account"
      redirect_to user_products_path(session[:user_id])
    end
  end

end
