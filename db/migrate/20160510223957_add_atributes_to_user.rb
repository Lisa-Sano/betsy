class AddAtributesToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :card_name
    end
  end
end
