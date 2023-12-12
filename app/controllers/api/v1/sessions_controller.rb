class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in(user, store: false)  # Sign in the user without storing in the session
      Rails.logger.debug("Session during sign in: #{session.inspect}")

      # Set the user_id in the session
      session[:user_id] = user.id

      render json: { user: user, message: 'Signed in successfully' }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    Rails.logger.debug("Session during sign out: #{session.inspect}")
    puts @current_user
    session[:user_id] = nil
    # Clear the signed cookie during sign-out
    cookies.delete(:user_id)

    render json: { message: "Signed out successfully" }
  end
end
