class Api::V1::TutorialsController < ApplicationController
    def index
      @tutorials = Tutorial.all
  
      if @tutorials
        render json: { status: 'success', message: 'Tutorials loaded', data: @tutorials }, status: :ok
      else
        render json: { status: 'error', message: 'Tutorials not found', data: @tutorials.errors }, status: :bad_request
      end
    end
  
    def show
      @tutorial = Tutorial.find_by(id: params[:id])
  
      if @tutorial
        render json: { status: 'success', message: 'Tutorial loaded', data: @tutorial }, status: :ok
      else
        render json: { status: 'error', message: 'Tutorial not found', data: nil }, status: :not_found
      end
    end
  
    def create
      @tutorial = Tutorial.new(tutorial_params)
  
      if @tutorial.save
        render json: { status: 'success', message: 'Tutorial created', data: @tutorial }, status: :ok
      else
        render json: { status: 'error', message: 'Tutorial not created', data: @tutorial.errors },
               status: :unprocessable_entity
      end
    end
  
    def destroy
      @tutorial = Tutorial.find_by(id: params[:id])
  
      if @tutorial.nil?
        render json: { status: 'error', message: 'Console not found', data: nil }, status: :not_found
      elsif @tutorial.destroy
        render json: { status: 'success', message: 'Console deleted', data: @tutorial }, status: :ok
      end
    end
  
    private
  
    def tutorial_params
      params.require(:console).permit(:title, :tutorial_price, :scheduling_price, :description, :photo)
    end
  end
  