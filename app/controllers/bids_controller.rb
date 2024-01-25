class BidsController < ApplicationController
  before_action :load_train_operator_and_parcel, only: [:create]

  def index
    @bids = Bid.all
    render json: @bids
  end

  def create
    bid = Bid.new(train_operator: @train_operator, parcel: @parcel, amount: params[:amount])

    if bid.save
      render json: bid, status: :created
    else
      render json: { error: bid.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def load_train_operator_and_parcel
    @train_operator = TrainOperator.find_by(id: params[:train_operator_id])
    @parcel = Parcel.find_by(id: params[:parcel_id])

    return if @train_operator && @parcel

    render json: { error: 'Train Operator or Parcel not found.' }, status: :not_found
  end
end
