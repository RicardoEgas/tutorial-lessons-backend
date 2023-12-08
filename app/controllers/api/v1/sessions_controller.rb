class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!, only: :destroy
    respond_to :json
  
    def create
      user = User.find_for_database_authentication(email: params[:user][:email])
  
      if user && user.valid_password?(params[:user][:password])
        sign_in(user, store: false)  # Sign in the user without storing in the session
        Rails.logger.debug("Session during sign in: #{session.inspect}")
        render json: { user: user, message: 'Signed in successfully' }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def destroy
      Rails.logger.debug("Session during sign out: #{session.inspect}")
      puts @current_user
      sign_out(@current_user)
      render json: { message: "Signed out successfully" }
    end
  end
