require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      offer = FactoryBot.create(:offer)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
