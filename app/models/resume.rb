class Resume < ApplicationRecord
  belongs_to :user

  has_one_attached :resume

  validates :user_id, :resume, presence: true
end
