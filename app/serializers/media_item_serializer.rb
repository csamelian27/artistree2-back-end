class MediaItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link

  belongs_to :user
end
