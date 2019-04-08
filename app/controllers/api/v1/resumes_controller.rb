class Api::V1::ResumesController < ApplicationController

  def show
    @resume = Resume.find(params[:id])
    render json: @resume
  end

  def create
    @resume = Resume.create(resume_params)
    if !@resume.resume.blank?
      @resume.resume.attach(resume_params[:resume])
    end
    render json: @resume
    # if @resume.valid?
    #   render json: @resume
    # else
    #   render json: { error: @resume.errors.full_messages }, status: :not_acceptable
    # end
  end

  private

  def resume_params
    params.require(:resume).permit(:user_id, :resume)
  end
end
