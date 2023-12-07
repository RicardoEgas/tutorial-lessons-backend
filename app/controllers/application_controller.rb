class ApplicationController < ActionController::Base
    before_action :authenticate_user!, if: :api_request?

    before_action :update_allowed_parameters, if: :devise_controller?

    protected

    def api_request?
        request.format.json?
    end

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit(:name, :email, :password, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
         u.permit(:name, :email, :password, :current_password)
        end
    end
end
