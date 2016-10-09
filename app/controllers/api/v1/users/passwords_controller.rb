class  Api::V1::Users::PasswordsController < Devise::PasswordsController

  def update
    @user = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_attempt unless @user

    if @user.valid_password?(params[:user][:old_password])
      user_parameters = { password: params[:user][:new_password] }
      @user.update(user_parameters)
      sign_in @user
      render json: @user
    else
      invalid_password
    end
  end

  private
  def invalid_attempt
    warden.custom_failure!
    render json: {error: "invalid attempt"}, status: :unprocessable_entity
  end

  def invalid_password
    warden.custom_failure!
    render json: {error: "invalid password"}, status: :unprocessable_entity
  end
end
