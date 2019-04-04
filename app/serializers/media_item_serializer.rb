class MediaItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :user_id

  belongs_to :user
end
