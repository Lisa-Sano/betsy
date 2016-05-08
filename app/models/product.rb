class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :order_items
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :stock, :user_id, presence: true, numericality: { only_integer: true }
  validates :user_id, :stock, presence: true

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

  def display_avg(product, reviews)
    if (product.avg_rating(reviews)) > 0
      "Average rating: #{product.avg_rating(reviews)}"
    else
      "No reviews yet."
    end
  end

  def in_stock?
   self.stock >= 1
  end

  def to_cents(amount)
    amount = amount.gsub(/[^0-9]/, '').to_i
  end
end
