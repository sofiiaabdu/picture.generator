class RemoveUrlFromFavourites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favourites, :url, :string
  end
end
