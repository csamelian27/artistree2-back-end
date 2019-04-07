class Api::V1::UsersController < ApplicationController
  include Rails.application.routes.url_helpers
  skip_before_action :authorized, only: [:show, :create]
  before_action :find_user, only: [:show, :update]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if !@user.avatar.blank?
      @user.avatar.attach(user_params[:avatar])
    end
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    # if !@user.resume.blank?
    #   @user.resume.attach(user_params[:resume])
    # end
    # render json: url_for(@user.resume)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :avatar)
  end
end
