class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist_name
      t.string :year_released
      t.string :format
      t.string :catalog_number

      t.timestamps
    end
  end
end
