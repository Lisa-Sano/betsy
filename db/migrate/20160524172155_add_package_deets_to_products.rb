class AddPackageDeetsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :real
    add_column :products, :height, :real
    add_column :products, :length, :real
    add_column :products, :width, :real
  end
end
