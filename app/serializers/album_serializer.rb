class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist_name, :year_released, :format, :catalog_number, :user_id
end
