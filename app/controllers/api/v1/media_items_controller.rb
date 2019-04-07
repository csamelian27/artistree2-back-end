class Api::V1::MediaItemsController < ApplicationController
  skip_before_action :authorized

  def index
    @media_items = MediaItem.all
    render json: @media_items
  end

  def show
    @media_item = MediaItem.find(params[:id])
    render json: url_for(@media_item.file)
  end

  def create
    @media_item = MediaItem.create(media_item_params)
    if !@media_item.file.blank?
      @media_item.file.attach(media_item_params[:file])
    end
    render json: @media_item
  end

  private

  def media_item_params
    params.require(:media_item).permit(:title, :description, :category, :user_id, :file)
  end

end
