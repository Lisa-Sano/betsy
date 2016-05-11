class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  # validates :user_id, presence: true, uniqueness: true
  # # validates :review??
  # validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  # call this on an instance of review
  def get_user_name
    if self.user_id == nil || self.user_id == 0
      "Guest user"
    else
      User.find(self.user_id).name
    end
  end

end
