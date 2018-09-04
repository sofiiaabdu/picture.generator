class Picture < ApplicationRecord
  belongs_to :user

  def self.find_all_pictures_by_user_id(id)
    where(user_id: id)
  end
end
