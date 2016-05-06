class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :order_items

  def avg_rating(reviews)
    sum = 0
    count = 0
    reviews.each do |review|
      sum += review.rating
      count += 1
    end
    if count == 0
      0
    else
      sum/count
    end
  end

end
