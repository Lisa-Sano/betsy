class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def add_to_cart(product)
    @order_items = OrderItem.new(product_id: product.product_id, order_id: session[order_id:], quantity:  )
  end
end
