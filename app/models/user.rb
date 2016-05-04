class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :reviews

  validates :name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def self.log_in(email, password)
    somebody = find_by(email: email)
    somebody && somebody.authenticate(password)
  end
end
