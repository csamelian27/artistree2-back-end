class ResumesController < ApplicationController

  def create
    if !@resume.resume.blank?
      @resume.resume.attach(resume_params[:resume])
    end
    render json: url_for(@resume.resume)
  end

  private

  def resume_params
    params.require(:resume).permit(:user_id, :resume)
  end
end
