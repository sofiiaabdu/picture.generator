class RemoveDescriptionFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :description, :string
  end
end
