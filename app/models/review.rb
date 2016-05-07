class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # t.integer  "product_id", null: false
  # t.integer  "user_id"
  # t.string   "review"
  # t.integer  "rating",     null: false
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  validates :user_id, presence: true, uniqueness: true
  # validates :review??
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  def get_user_name
    if user
      user.name
    else
      "Guest user"
    end
  end

  def display_name(user)
    name = @user.name || "guest"
  end
end
