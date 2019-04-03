class Api::V1::MediaItemsController < ApplicationController

  def index
    @media_items = MediaItem.all
    render json: @media_items
  end

end
