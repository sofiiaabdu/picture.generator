class Picture < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy

  scope :pictures_by_user, -> (id) { where(user_id: id) }
end
