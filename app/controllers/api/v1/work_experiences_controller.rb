class Api::V1::WorkExperiencesController < ApplicationController

  def show
    @work_experience = WorkExperience.find(params[:id])
    render json: @work_experience
  end

  def create
    @work_experience = WorkExperience.create(work_experiences_params)
    render json: @work_experience
  end

  private

  def work_experiences_params
    params.require(:work_experience).permit(:user_id, :business_name, :description, :months_range, :contact_person, :contact_number)
  end
end
