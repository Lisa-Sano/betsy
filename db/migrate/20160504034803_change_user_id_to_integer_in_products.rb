class ChangeUserIdToIntegerInProducts < ActiveRecord::Migration
  def change
    change_column :products, :user_id, 'integer USING CAST("user_id" AS integer)'
  end
end
