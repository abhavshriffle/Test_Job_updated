require 'rails_helper'

RSpec.describe ParcelsController, type: :controller do
  describe 'GET #index' do
    let(:parcel_owner) { FactoryBot.create(:parcel_owner) }

    context 'when parcel owner is found' do
      before { get :index, params: { parcel_owner_id: parcel_owner.id } }

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns the parcels owned by the parcel owner' do
        expect(JSON.parse(response.body)).to eq(parcel_owner.parcels.as_json)
      end
    end

    context 'when parcel owner is not found' do
      before { get :index, params: { parcel_owner_id: 999 } }

      it 'returns a not found response' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(JSON.parse(response.body)).to eq({ 'message' => 'Parcel owner not found' })
      end
    end
  end
end
