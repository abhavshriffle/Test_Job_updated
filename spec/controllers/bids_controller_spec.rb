require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe 'GET#index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST#create' do
    let(:bid) { FactoryBot.create(:bid) }
    context 'with valid parameters' do
      it 'will create bid' do
        post :create, params: { bid: bid, parcel_id: 1, train_operator_id: 1, amount: 1000 }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with unvalid parameters' do
      it 'will not create bid' do
        post :create
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
