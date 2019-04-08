class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :business_name, :description, :year_began, :year_ended
end
