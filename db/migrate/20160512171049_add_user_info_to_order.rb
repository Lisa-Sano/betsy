class AddUserInfoToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string   "name"
      t.string   "email"           
      t.string   "address"
      t.string   "city"
      t.string   "state"
      t.integer  "zip"
      t.string   "card_name"
      t.integer  "last_four_cc"
      t.datetime "cc_exp"
      t.integer  "cc_cvv"
      t.integer  "billing_zip"
    end
  end
end
