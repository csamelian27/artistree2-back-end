class MediaItem < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :user_id, :title, :description, :category, :file, :file_type, presence: true
end
