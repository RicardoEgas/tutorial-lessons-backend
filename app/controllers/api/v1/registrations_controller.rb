class Api::V1::RegistrationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    respond_to :json

    def create
        @user = User.new(user_params)

        if @user.save
            render json: { user: @user, message:"User created successfully" }
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

  def update
    super
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
