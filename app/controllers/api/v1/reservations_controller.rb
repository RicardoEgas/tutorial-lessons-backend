class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!
  before_action :set_tutorial
  before_action :set_reservation, only: [:destroy]

  def index
    reservations = @tutorial.reservations
    render json: reservations, status: :ok
  end

  def create
    puts @current_user
    reservation = @tutorial.reservations.build(user: @current_user, reserve_date: params[:reserve_date])

    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_tutorial
    @tutorial = Tutorial.find(params[:tutorial_id])
  end

  def set_reservation
    @reservation = @tutorial.reservations.find(params[:id])
  end
end
