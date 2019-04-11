class User < ApplicationRecord
  has_secure_password
  has_many :media_items
  has_many :work_experiences
  has_many :resumes
  has_one_attached :avatar

  validates :full_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end
