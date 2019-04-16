class Api::V1::CollabPostsController < ApplicationController

  def index
    @collab_posts = CollabPost.all
    render json: @collab_posts
  end

  def create
    @collab_post = CollabPost.create(collab_post_params)
    render json: @collab_post
  end

  private
  def collab_post_params
    params.require(:collab_post).permit(:user_id, :title, :description, :seeking)
  end
end
