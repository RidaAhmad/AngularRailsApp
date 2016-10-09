class Api::V1::Users::SessionsController < Devise::SessionsController
  include Authenticateable

  skip_before_action :verify_signed_out_user, only: [:destroy]
  before_action :authenticate_user_from_token!, only: [:destroy]

  def create
    @user = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(params[:user][:password])
      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    else
      invalid_login_password
    end
  end

  def destroy
    current_user.generate_access_token!
    current_user.save
    sign_out current_user
    render json: {message: "Successfully signed out."}, status: 200
  end

  private
  def ensure_params_exist
    return unless params[:user].blank?
    render json: {error: "missing user parameters"}, status: :unprocessable_entity
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {error: "invalid_login_attempt"}, status: :unprocessable_entity
  end

  def invalid_login_password
    warden.custom_failure!
    render json: {error: "invalid_login_password"}, status: :unprocessable_entity
  end
end
