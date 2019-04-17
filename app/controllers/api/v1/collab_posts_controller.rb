class Api::V1::CollabPostsController < ApplicationController
  before_action :set_collab_post, only: [:show, :update]

  def index
    @collab_posts = CollabPost.all
    render json: @collab_posts
  end

  def show
    render json: @collab_post
  end

  def create
    @collab_post = CollabPost.create(collab_post_params)
    render json: @collab_post
  end

  def update
    @collab_post.update(collab_post_params)
    render json: @collab_post
  end

  private
  def set_collab_post
    @collab_post = CollabPost.find(params[:id])
  end

  def collab_post_params
    params.require(:collab_post).permit(:user_id, :title, :description, :seeking, :claimed)
  end
end
