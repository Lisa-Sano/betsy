class RemoveCategoryFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :category, :string
  end
end
