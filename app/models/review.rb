class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :review, length: {maximum: 500, message: "Review has exceeded length."}, allow_blank: true

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  validates_associated :product

end
