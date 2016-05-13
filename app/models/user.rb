class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :reviews

  validates :name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #validates :zip

  has_secure_password

  def self.log_in(email, password)
    somebody = find_by(email: email)
    somebody && somebody.authenticate(password)
  end

  def self.my_account?(current_user, url_user_id)
    !current_user.nil? && current_user.id == url_user_id
  end

  def total_revenue
    OrderItem.where(product_id: products).map { |item| item.product.price }.sum
  end
end
