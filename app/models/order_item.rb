class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def subtotal
    product.price * quantity
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
