class Api::V1::UsersController < ApplicationController
  include Rails.application.routes.url_helpers
  skip_before_action :authorized, only: [:show, :create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    @user.avatar.attach(params[:avatar])
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
