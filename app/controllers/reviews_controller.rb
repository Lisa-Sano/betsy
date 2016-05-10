
# product_reviews     GET    /products/:product_id/reviews(.:format)     reviews#index
#                     POST   /products/:product_id/reviews(.:format)     reviews#create
# new_product_review  GET    /products/:product_id/reviews/new(.:format) reviews#new

# user_reviews          GET    /users/:user_id/reviews(.:format)           reviews#index
#                       POST   /users/:user_id/reviews(.:format)           reviews#create
# new_user_review       GET    /users/:user_id/reviews/new(.:format)       reviews#new

class ReviewsController < ApplicationController

  helper_method :top_ratings, :display_name
  # from older commit
    def new
      @review = Review.new
      @product = Product.find(params[:product_id])
      @user = current_user
    end

    def create
      @product = Product.find(params[:review][:product_id])
      @review = Review.create(review_edit_params[:review])
      if @review.save
        redirect_to product_path(@review.product_id)
      else
        flash.now[:alert] = 'Review could not be saved.'
        render :new
      end
    end


  def index
    @reviews = Review.all

    #how to make this more efficient?
    @top_ratings = Review.where(rating: 5)
    @products_today = Review.where(updated_at: Time.zone.now.beginning_of_day)
  end

  def show
    @reviews = Review.where(user_id: params[:user_id])
  end

  # def display_name(user)
  #   user.name || "guest"
  # end
  # 
  # def display_name(user)
  #   if user
  #     user.name
  #   else
  #     "Guest user"
  #   end
  # end

  private

  def review_edit_params
    params.permit(review: [:product_id, :user_id, :review, :rating])
  end

end
