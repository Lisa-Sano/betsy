class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :order_items

  def in_stock?
   self.stock >= 1
  end
end
