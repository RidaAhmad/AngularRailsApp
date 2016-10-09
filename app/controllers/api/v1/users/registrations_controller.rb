class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  include Authenticateable

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, serializer: RegistrationSerializer, root: nil
    else
      render json: @user.errors, status: 404
    end
  end

  private
  def invalid_attempt
    render json: {error: "invalid attempt"}, status: :unprocessable_entity
  end

  def invalid_password
    render json: {error: "invalid password"}, status: :unprocessable_entity
  end

  def user_params
    params.require(:user).permit(:id, :email, :username, :access_token, :password, :attachment)
  end
end
