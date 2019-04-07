class ResumeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :resume

  belongs_to :user

  def resume
    {resume_url: self.object.resume.blob.service_url}
  end
end
