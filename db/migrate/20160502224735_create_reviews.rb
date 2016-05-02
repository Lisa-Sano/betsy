class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.string :review
      t.integer :rating, null: false
      t.timestamps null: false
    end
  end
end
