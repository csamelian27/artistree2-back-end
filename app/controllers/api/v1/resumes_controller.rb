class Api::V1::ResumesController < ApplicationController

  def show
    byebug
    @user = Resume.find(params[:user_id])
    render url_for(@user.resume)
  end

  def create
    @resume = Resume.create(resume_params)
    if !@resume.resume.blank?
      @resume.resume.attach(resume_params[:resume])
    end
    render json: @resume
  end

  private

  def resume_params
    params.require(:resume).permit(:user_id, :resume)
  end
end
