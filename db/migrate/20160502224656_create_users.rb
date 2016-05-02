class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :password
      t.string :email, null: false
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :last_four_cc
      t.datetime :cc_exp
      t.integer :cc_cvv
      t.integer :billing_zip
      t.timestamps null: false
    end
  end
end
