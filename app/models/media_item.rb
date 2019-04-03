class MediaItem < ApplicationRecord
  belongs_to :user
  has_many_attached :files
end
