class Api::V1::MediaItemsController < ApplicationController
  skip_before_action :authorized

  def index
    @media_items = MediaItem.all
    render json: @media_items
  end

  def create
    byebug
    @media_item = MediaItem.create(media_item_params)
    render json: @media_item
  end

  private

  def media_item_params
    params.require(:media_item).permit(:title, :description, :category, :user_id, :files)
  end

end
