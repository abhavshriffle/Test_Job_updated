require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    include ActiveJob::TestHelper
    let(:train) { FactoryBot.create(:train) }
    let(:parcels) { FactoryBot.create(:parcel) }
    let(:parcel_owner) { FactoryBot.create(:parcel_owner) }
    let(:valid_attributes) do
      attributes_for(:booking, train_id: train.id, parcel_id: parcels.id, parcel_owner_id: parcel_owner.id, line_name: 'line name', time: '7:00PM', base_cost_per_unit_distance: 10, additional_cost_factor: 50, distance: 50, weight: 100, volume: 100)
    end
    let(:invalid_attributes) do
      attributes_for(:booking).except(:train_id)
    end

    context 'with valid parameters' do
      it 'creates a new Booking' do
        expect do
          post :create, params: { booking: valid_attributes }
        end
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid parameters' do
      let!(:train) { FactoryBot.create(:train) }
      let!(:train_line) { FactoryBot.create(:line) }
      it 'creates a new Booking and schedules TrainUnavailableWorker' do
        expect do
          post :create,params: { booking: valid_attributes, train_id: 2, train_line: @train_line, train_line_id: train_line.id }
        end.to change(Booking, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      let!(:train) { FactoryBot.create(:train) }
      let!(:train_line) { FactoryBot.create(:line) }

      it 'does not create a new Booking and does not schedule TrainUnavailableWorker' do
        expect do
          post :create,params: { booking: invalid_attributes, train_id: 2, train_line: @train_line, train_line_id: train_line.id }
        end.to_not change(Booking, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when train is not found' do
      it 'returns not found status' do
        post :create, params: { booking: valid_attributes, train_id: 999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET #booked_trains' do
    it 'returns a success response' do
      get :booked_trains
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #booking_status' do
    it 'returns a success response' do
      booking = FactoryBot.create(:booking, is_withdraw: true)
      patch :booking_status, params: { booking_id: booking.id, line_name: 'line name' }
      expect(response).to have_http_status(:success)
    end
  end
end
