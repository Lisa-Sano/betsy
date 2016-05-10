class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # validates :user_id, presence: true, uniqueness: true
  # # validates :review??
  # validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  def get_user_name
    if user
      user.name
    else
      "Guest user"
    end
  end


  #
  # def top_ratings
  #   top_ratings = @reviews.each.where(rating: 5)
  # end
end
