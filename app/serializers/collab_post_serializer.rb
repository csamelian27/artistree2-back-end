class CollabPostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :seeking

  belongs_to :user
  has_one :collaboration
end
