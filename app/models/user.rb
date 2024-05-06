class User < ApplicationRecord
  has_secure_password

  has_many :user_travels
  has_many :travels, through: :user_travels

  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true

end
