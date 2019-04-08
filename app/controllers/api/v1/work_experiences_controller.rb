class Api::V1::WorkExperiencesController < ApplicationController

  def create
    @work_experience = WorkExperience.create(work_experiences_params)
    render json: @work_experience
  end

  private

  def work_experiences_params
    params.require(:work_experiences).permit(:user_id, :business_name, :description, :months_range, :contact_person, :contact_number)
  end
end
