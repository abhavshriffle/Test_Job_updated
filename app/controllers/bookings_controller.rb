class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def create
    @train = Train.where(status: true).order(capacity: :desc).first
    @train_line = Line.find_by(id: params[:train_line_id])
    if @train.present? && @train_line.present?
      @train_line.update(status: 1)
      @train.update(status: false)
      @booking = Booking.new(booking_params)
      if @booking.save
        TrainUnavailableWorker.perform_in(3.hours, @train.id, @train_line.id)
        render json: @booking, status: :created
      else
        render json: @booking.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Train not found or unavailable.' }, status: :not_found
    end
  end

  def booked_trains
    distinct_line_names = Train.joins(:bookings).distinct.pluck(:line_name)

    @booked_trains = distinct_line_names.map do |line_name|
      Train.joins(:bookings).where('trains.status = ? AND trains.line_name = ?', true, line_name).first
    end
    render json: @booked_trains
  end

  def booking_status
    @booking = Booking.find_by(id: params[:booking_id])
    return unless @booking.update(is_withdraw: false)

    train_status = Train.find_by(id: @booking.train.id).update(status: false)
    render json: { message: 'Train and booking status update.', booking_status: @booking.is_withdraw }
  end

  private

  def booking_params
    params.require(:booking).permit(:train_id, :parcel_id, :parcel_owner_id, :line_name, :is_withdraw)
  end
end
