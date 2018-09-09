class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  scope :favourites_by_user, -> (id) { where(user_id: id) }
  scope :favourites_by_picture, -> (id) { where(picture_id: id) }
end
