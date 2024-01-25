class ParcelsController < ApplicationController
  before_action :find_parcel_owner

  def index
    if @parcel_owner
      render json: @parcel_owner.parcels
    else
      render json: { message: 'Parcel owner not found' }, status: :not_found
    end
  end

  private

  def find_parcel_owner
    @parcel_owner = ParcelOwner.find_by(id: params[:parcel_owner_id])
  end
end
