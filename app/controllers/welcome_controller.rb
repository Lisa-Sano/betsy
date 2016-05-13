class WelcomeController < ApplicationController
  def index
    @jewelry = Category.find_by_name("Jewelry")
    @shoes = Category.find_by_name("Shoes")
    @accessories = Category.find_by_name("Accessories")
    @clothing = Category.find_by_name("Clothing")
  end
end
