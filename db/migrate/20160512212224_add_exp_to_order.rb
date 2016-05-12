class AddExpToOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :cc_exp, :datetime
    add_column :orders, :cc_exp_month, :string
    add_column :orders, :cc_exp_year, :string
  end
end
