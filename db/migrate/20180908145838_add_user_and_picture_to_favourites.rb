class AddUserAndPictureToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favourites, :user, foreign_key: true
    add_reference :favourites, :picture, foreign_key: true
  end
end
