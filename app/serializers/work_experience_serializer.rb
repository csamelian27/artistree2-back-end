class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :business_name, :description, :months_range, :contact_person, :contact_number

  belongs_to :user
end
