class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user_from_token!, only: [:update]

  def show
    @user = User.find(params[:id])

    render json: @user, serializer: UserSerializer, root: nil
  end

  def update
    @user = User.find(params[:id])
    return invalid_attempt unless @user

    if @user.valid_password?(params[:user][:password])
      user_parameters = { username: params[:user][:username] }
      @user.update(user_parameters)
      render json: @user, serializer: UserSerializer, root: nil
    else
      render json: {error: 'Access Denied!'}, status: 401
    end
  end
end
