class ReservationsController < ApplicationController
  def show
    reservation = Reservation.find(params[:id])
    render json: reservation
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Reservation not found" }, status: :not_found
  end
end
