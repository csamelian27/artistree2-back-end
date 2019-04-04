class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def show
    jwt = request.headers['Authorization']
    without = jwt.split('Bearer ')
    id = JWT.decode(without[1], "cass")[0]["user_id"]
    @user = User.find(id)
    render json: @user
  end

  def create # POST /api/v1/login
    # byebug
    @user = User.find_by(email: user_login_params[:email])
    # @user.authenticate('password')
    if @user && @user.authenticate(user_login_params[:password])
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private
  def user_login_params
    # { user: { username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:email, :password)
  end
end
