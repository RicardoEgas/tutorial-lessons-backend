class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # before_action :current_user

  protected


  def authenticate_user_by_token
    token = request.headers['Authorization']&.split&.last

    unless token
      render json: { error: 'Unauthorized: Token missing' }, status: :unauthorized
      return
    end

    begin
      decoded_token = decode_token(token)
      user_id = decoded_token.first['user_id']
      @current_user = User.find_by(id: user_id)

      unless @current_user
        render json: { error: 'Unauthorized: User not found' }, status: :unauthorized
      end
    rescue JWT::DecodeError => e
      render json: { error: "Unauthorized: #{e.message}" }, status: :unauthorized
    end
  end

  def decode_token(token)
    JWT.decode(token, 'thesecretkeywhichwillbechangedlaterwithrandomlygeneratedkey', true, algorithm: 'HS256')
  end
end