class Api::V1::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      token = encode_token(user)
      render json: {
        message: 'User is logged in',
        token: token,
      }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  # def create
  #   puts "***********"
  #   user = User.find_for_database_authentication(email: params[:user][:email])
  #   puts user.name

  #   if user&.valid_password?(params[:user][:password])
  #     sign_in(user, store: false) # Sign in the user without storing in the session
  #     Rails.logger.debug("Session during sign in: #{session.inspect}")

  #     token = encode_token(user)

  #     render json: { user:, message: 'Signed in successfully', token: token }
  #   else
  #     render json: { error: 'Invalid email or password' }, status: :unauthorized
  #   end
  # end

  # def destroy
  #   Rails.logger.debug("Session during sign out: #{session.inspect}")
  #   puts @current_user
  #   session[:user_id] = nil
  #   # Clear the signed cookie during sign-out
  #   cookies.delete(:user_id)

  #   render json: { message: 'Signed out successfully' }
  # end

  private

  def encode_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, 'thesecretkeywhichwillbechangedlaterwithrandomlygeneratedkey', 'HS256')
  end
end
