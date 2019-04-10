class MediaItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :user_id, :file, :file_type

  def file
    {file_url: self.object.file.blob.service_url}
  end

  belongs_to :user
end
