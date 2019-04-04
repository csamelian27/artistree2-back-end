class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :avatar

  has_many :media_items
end
