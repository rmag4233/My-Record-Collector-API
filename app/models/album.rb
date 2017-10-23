class Album < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :year_released, presence: true
  validates :format, presence: true
end
