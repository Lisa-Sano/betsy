class RemoveNullConstraintOnReviewsTable < ActiveRecord::Migration
  def change
    change_column :reviews, :user_id, :integer, :null => true
  end
end
