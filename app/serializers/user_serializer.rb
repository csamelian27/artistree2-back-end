class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :password_digest

  has_many :media_items
end
