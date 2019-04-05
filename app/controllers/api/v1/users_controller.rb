class Api::V1::UsersController < ApplicationController
  include Rails.application.routes.url_helpers
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    # byebug
    @user = User.find(params[:id])
    # @medias = @user.media_items.map do |item|
    #   url_for(item)
    # end
    render json: @user
  end

  def create
    # byebug
    @user = User.create(user_params)
    # @user.avatar.attach(io: File.open("C:\fakepath\dance_me.jpg.jpg"), filename: "dance_me.jpg", content_type: "image/jpg")
    @user.avatar.attach(params[:avatar])
    # @user.avatar.purge
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :avatar)
  end
end
