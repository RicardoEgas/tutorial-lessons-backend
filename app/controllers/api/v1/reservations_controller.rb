class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user_by_token
  before_action :set_tutorial, only: %i[index create destroy show]
  before_action :set_reservation, only: %i[destroy show]

  def index
    reservations = @tutorial.reservations
    render json: reservations, status: :ok
  end

  def show
    if @reservation.user.id == @current_user.id
      render json: { reservation: @reservation, message: 'reservation' }, status: :ok
    else
      render json: { errors: 'This reservation does not belong to this user' }, status: :forbidden
    end
  end

  def user_reservations
    reservations = @current_user.reservations
    @reservations_output = []

    reservations.each do |reservation|
      x = {
        reservation: reservation.as_json.merge(tutorialTitle: reservation.tutorial.title),
        tutorial: reservation.tutorial.as_json
      }
      @reservations_output << x
    end

    render json: @reservations_output, status: :ok
  end

  def create
    reservation = @tutorial.reservations.build(reserve_params.merge(user: @current_user))

    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.user.id == @current_user.id
      @reservation.destroy
      render json: { message: 'reservation deleted successfully' }, status: :ok
    else
      render json: { errors: "The user doesn't have the right to delete the reservation" }, status: :forbidden
    end
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
