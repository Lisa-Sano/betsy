class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      # user_id here meaning merchant_id
      t.string :user_id
      t.string :description
      t.string :category
      t.integer :stock, null: false
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
