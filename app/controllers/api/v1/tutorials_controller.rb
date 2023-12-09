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
    tutorial = Tutorial.new(tutorial_params)
    if tutorial.save
      render json: tutorial, status: :created
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
    @tutorial.destroy
    head :no_content
  end

  private

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :tutorial_price, :scheduling_price)
  end
end
