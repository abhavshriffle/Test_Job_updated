require 'rails_helper'

RSpec.describe TrainOperatorsController, type: :controller do
  describe 'GET#index' do
    context 'For showing all train' do
      it 'render all the train' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    let(:train_params) do
      {
        train_operator_id: 1,
        line_id: 1,
        capacity: 200,
        status: true,
        line_name: 'Example Line',
        time: '12:00 PM',
        base_cost_per_unit_distance: 5,
        additional_cost_factor: 0.2,
        distance: 100,
        weight: 150,
        volume: 200
      }
    end

    context 'with valid parameters' do
      it 'creates a new Train and renders the response' do
        post :create,
             params: { train: train_params, capacity: 100, train_operator_id: 1, line_id: 1, base_cost_per_unit_distance: 5, additional_cost_factor: 0.2, distance: 100 }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        allow_any_instance_of(Train).to receive(:save).and_return(false)
      end

      it 'renders an error response' do
        post :create, params: { train: train_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    let!(:train) { FactoryBot.create(:train) }

    context 'when train is found' do
      it 'renders the cost response' do
        get :show, params: { id: train.id, distance: 100 }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to have_key('cost')
      end
    end
  end

  describe 'GET #available_trains' do
    context 'when there are available trains' do
      it 'returns a success response with available trains' do
        available_trains = FactoryBot.create_list(:train, 3, status: true)
        get :available_trains
        expect(response).to have_http_status(:success)
      end
    end

    context 'when there are no available trains' do
      it 'returns an empty response' do
        get :available_trains
        expect(response).to have_http_status(:success)
      end
    end

    context 'when an error occurs' do
      it 'returns an error response' do
        allow(Train).to receive(:where).and_raise(StandardError.new('Custom error'))
        get :available_trains
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Custom error' })
      end
    end
  end

  describe 'GET #best_fit' do
    let(:parcels) { [10, 20, 30] }
    let(:train_capacities) { [100, 150] }
    let(:train_costs) { [500, 800] }
    let(:base_cost_per_unit_distance) { 6 }
    let(:additional_cost_factor) { 10 }
    let(:train_id) { 1 }
    let(:distance) { 50 }

    context 'with valid parameters' do
      it 'returns the best fit assignment' do
        get :best_fit,
            params: { parcels: parcels, train_capacities: train_capacities, train_costs: train_costs, train_id: train_id,base_cost_per_unit_distance: 6, additional_cost_factor: 10, distance: 50 }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'renders an error response' do
        get :best_fit, params: { parcels: [], train_costs: [] }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Parcels and train costs must be provided.' })
      end
    end
  end
end
