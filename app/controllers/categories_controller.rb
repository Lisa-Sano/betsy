class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params[:category])
    @category.name.capitalize!
    if @category.save
      redirect_to user_products_path(current_user.id)
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(category: [:name])
  end
end
