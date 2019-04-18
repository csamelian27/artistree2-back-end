class User < ApplicationRecord
  has_secure_password
  has_many :media_items
  has_many :work_experiences
  has_many :resumes
  has_one_attached :avatar
  has_many :collaborated_users, foreign_key: :collaborator_id, class_name: 'Collaboration'
  has_many :collaborating_users, foreign_key: :collaboratee_id, class_name: 'Collaboration'
  has_many :collaboratees, through: :collaborated_users
  has_many :collaborators, through: :collaborating_users
  has_many :collab_posts
  # has_many :collaborations, through: :collaboratees
  # has_many :collaborations, through: :collaborators

  validates :full_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end
