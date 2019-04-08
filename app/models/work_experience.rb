class WorkExperience < ApplicationRecord
  belongs_to :user

  validates :user_id, :business_name, :description, :months_range, :contact_person, presence: true
end
