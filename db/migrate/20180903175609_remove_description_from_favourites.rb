class RemoveDescriptionFromFavourites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favourites, :description, :string
  end
end
