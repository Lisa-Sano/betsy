class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def add_product(product, quantity)
    @order_items = OrderItem.new(product_id: product.id, order_id: 1, quantity: quantity)
  end
end
