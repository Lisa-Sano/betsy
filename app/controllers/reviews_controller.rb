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
    @product = Product.find(params[:product_id])
    @user = current_user
  end

  def create
    @review = Review.new(review_edit_params[:review])
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      flash.now[:alert] = 'Review could not be saved.'
      render :new
    end
  end

  # user_reviews          GET    /users/:user_id/reviews(.:format)           reviews#index
  def index
    # most popular items
    @reviews = Review.all.each
    @top_reviews = Review.where(rating: 5)
  end

  def show
    @reviews = Review.where(user_id: params[:user_id])
  end

  private

  def review_edit_params
    params.permit(review: [:product_id, :user_id, :review, :rating])
  end

end
