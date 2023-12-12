class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :api_request?, unless: :devise_controller?
  before_action :debug_current_user, if: :current_user_present?, unless: :devise_controller?
  before_action :current_user

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def api_request?
    request.format.json?
  end

  def current_user_present?
    defined?(user_signed_in?) && user_signed_in?
  end

  def debug_current_user
    Rails.logger.debug("Current user: #{@current_user.inspect}")
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  private

  def current_user
    return unless session[:user_id]
    
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
