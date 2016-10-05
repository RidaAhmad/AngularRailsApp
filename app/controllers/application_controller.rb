class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  include Authenticateable

  def authenticate_user_from_token!
    token = request.headers['Authorization']

    if token
      authenticate_with_access_token(token)
    else
      authenticate_error
    end
  end

  private
    def authenticate_with_access_token(token)
      user = User.where(access_token: token).first

      if user && Devise.secure_compare(user.access_token, token)
        sign_in user, store: false
      else
        authenticate_error
      end
    end

    def authenticate_error
      render json: {error: 'Unauthorized Access'}, status: 401
    end
end
