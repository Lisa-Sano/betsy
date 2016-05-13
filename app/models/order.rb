class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  validates :order_state, presence: true

  def already_ordered?(product, order_id)
    item = OrderItem.find_by_product_id_and_order_id( product.id, order_id)

    if item.nil?
      return false
    else
      return item
    end
  end

  def add_product(product, quantity, order_id)
    item = already_ordered?(product, order_id)

    if item
      item.quantity += quantity.to_f
      item.save
    else
      OrderItem.create(product_id: product.id, order_id: order_id, quantity: quantity)
    end
  end


  def order_total
    total = 0
    order_items.each do |item|
      product = Product.find(item.product_id)
      quantity_total = product.price * item.quantity
      total += quantity_total
    end
    return total
  end
end
