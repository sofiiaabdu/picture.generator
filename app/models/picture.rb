class Picture < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy

  scope :pictures_by_user, -> (id) { where(user_id: id) }
  scope :picture_by_user_and_id, -> (user_id, picture_id) { where(user_id: user_id) && where(id: picture_id)}
end
