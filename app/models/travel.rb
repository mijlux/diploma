class Travel < ApplicationRecord
  mount_uploader :city_image, CityImageUploader

  has_many :user_travels
  has_many :users, through: :user_travels
  has_many :reviews
end
