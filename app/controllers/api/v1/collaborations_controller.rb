class Api::V1::CollaborationsController < ApplicationController

  def create
    @collaboration = Collaboration.create(collaboration_params)
    render json: @collaboration
  end

  private
  def collaboration_params
    params.require(:collaboration).permit(:collaborator_id, :collaboratee_id, :collab_post_id)
  end
end
