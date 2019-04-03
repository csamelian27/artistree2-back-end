class MediaItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id

  belongs_to :user
end
