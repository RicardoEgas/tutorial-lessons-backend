class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!
  before_action :set_tutorial, only: [:create, :destroy]
  before_action :set_reservation, only: [:destroy]

  def index
    reservations = @tutorial.reservations
    render json: reservations, status: :ok
  end

  def user_reservations
    reservations = @current_user.reservations
    render json: reservations, status: :ok
  end

  def create
    puts "tutorial:------------"
    puts @tutorial.title
    puts @tutorial.scheduling_price
    puts "*********"
    puts @current_user.name
    puts "*-*-*-*-*-*-*"
    reservation = @tutorial.reservations.build(reserve_params.merge(user: @current_user))

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

  def reserve_params
    params.require(:reservation).permit(:reserve_date)
  end

end
