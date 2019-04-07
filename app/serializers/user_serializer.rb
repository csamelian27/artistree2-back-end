class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :avatar

  def avatar
    {avatar_url: self.object.avatar.blob.service_url}
  end

  has_many :media_items
  has_many :resumes
end
