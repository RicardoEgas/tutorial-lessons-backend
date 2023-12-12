class Api::V1::TutorialsController < ApplicationController
  skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tutorial, only: [:show, :update, :destroy]

  def index
    tutorials = Tutorial.all
    render json: tutorials, status: :ok
  end

  def show
    render json: @tutorial, status: :ok
  end

  def create
    tutorial = Tutorial.new(tutorial_params.merge(author_id: @current_user.id))
    if tutorial.save
      render json: { message: 'Tutorial created successfully', tutorial: tutorial }, status: :created
    else
      render json: { errors: tutorial.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @tutorial.update(tutorial_params)
      render json: @tutorial, status: :ok
    else
      render json: { errors: @tutorial.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @tutorial.author_id == @current_user.id
      @tutorial.destroy
      render json: { message: 'Tutorial deleted successfully' }, status: :ok
    else
      render json: { errors: "The user doesn't have the right to delete the tutorial" }, status: :forbidden
    end
  end

  private

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :tutorial_price, :scheduling_price, :author_id, :photo)
  end
end
