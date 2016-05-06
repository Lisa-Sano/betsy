class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def get_user_name
    if user
      user.name
    else
      "Guest user"
    end
  end
end
