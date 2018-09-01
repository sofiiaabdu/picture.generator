class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :url
      t.string :description

      t.timestamps
    end
  end
end
