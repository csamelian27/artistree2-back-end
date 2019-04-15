class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :avatar

  def avatar
    {avatar_url: self.object.avatar.blob.service_url}
  end

  has_many :media_items
  has_many :work_experiences
  has_many :resumes
  has_many :collaborated_users, foreign_key: :collaborator_id, class_name: 'Collaboration'
  has_many :collaborating_users, foreign_key: :collaboratee_id, class_name: 'Collaboration'
  has_many :collaboratees, through: :collaborated_users
  has_many :collaborators, through: :collaborating_users
end
