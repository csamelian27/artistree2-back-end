class User < ApplicationRecord
  has_secure_password
  has_many :media_items
  has_one_attached :avatar
end
