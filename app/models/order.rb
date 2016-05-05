class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def add_product(product, quantity, order_id)
    item = already_ordered?(product, order_id)

    if item
      item.quantity += quantity.to_f
      item.save
    else
      OrderItem.create(product_id: product.id, order_id: order_id, quantity: quantity)
    end
  end

  def already_ordered?(product, order_id)
    item = OrderItem.find_by_product_id_and_order_id( product.id, order_id)

    if item.nil?
      return false
    else
      return item
    end
  end
end
