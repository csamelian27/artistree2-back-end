class MediaItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :user_id, :files

  belongs_to :user
end
