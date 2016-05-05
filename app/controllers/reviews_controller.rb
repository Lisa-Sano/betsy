# In order to be a Review:
# Rating must be present &
# Rating must be an integer &
# Rating must be between 1 and 5

# As a guest user (or signed in user) I can: Leave a review for a product providing:
# A Text review
# A rating out of 5

# As a signed-in user, I cannot:
# Review my own products

# product_reviews     GET    /products/:product_id/reviews(.:format)     reviews#index
#                     POST   /products/:product_id/reviews(.:format)     reviews#create
# new_product_review  GET    /products/:product_id/reviews/new(.:format) reviews#new

# user_reviews          GET    /users/:user_id/reviews(.:format)           reviews#index
#                       POST   /users/:user_id/reviews(.:format)           reviews#create
# new_user_review       GET    /users/:user_id/reviews/new(.:format)       reviews#new

class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review.new = Review.new(review_edit_params[:review])
    if @review.save
      redirect_to :back
    else
      flash.now[:alert] = 'Review could not be saved.'
      render :new
    end
  end

  # user_reviews          GET    /users/:user_id/reviews(.:format)           reviews#index
  def index
    @reviews = Review.where(user_id: params[:user_id])
  end

  # def show
  #   @review = Vendor.find(params[:id])
  #   @beg_month = Time.now.beginning_of_month
  #   @end_month = Time.now.end_of_month
  #   @all_sales = @vendor.sales.where(purchase_time: (@beg_month..@end_month))
  # end
  
  def show

  end

  private

  def review_edit_params
    params.permit(review: [:product_id, :user_id, :review, :rating])
  end

end
