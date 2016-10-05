class Api::V1::Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
