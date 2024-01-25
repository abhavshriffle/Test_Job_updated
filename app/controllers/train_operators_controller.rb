class TrainOperatorsController < ApplicationController
  before_action :set_train, only: [:show]

  def index
    @trains = Train.order(capacity: :desc)
    render json: @trains.as_json(only: %i[id train_operator_id line_id capacity status])
  end

  def create
    @train = Train.new(train_params)
    @distance = @train.distance
    cost_service = CostService.new(@distance)
    if @train.save
      render_train_response(cost_service)
    else
      render_error_response(@train.errors.full_messages.join(', '))
    end
  end

  def show
    @distance = params[:distance].to_f
    render_error_response('Train not found.') unless @train.present?

    cost_service = CostService.new(@distance)
    @cost = cost_service.calculate_cost(@train, @distance)
    render json: { cost: @cost }
  end

  def available_trains
    @available_trains = Train.where(status: true)
    render json: @available_trains.as_json
  rescue StandardError => e
    render_error_response(e.message)
  end

  def best_fit
    return render_error_response('Parcels and train costs must be provided.') if invalid_best_fit_params?

    train_assignments = calculate_best_fit_assignment
    render json: train_assignments, status: :ok
  end

  private

  def set_train
    @train = Train.find_by(id: params[:id])
  end

  def render_train_response(cost_service)
    render json: {
      id: @train.id,
      cost: cost_service.calculate_cost(@train, @train.distance),
      train_operator_id: @train.train_operator_id,
      line_id: @train.line_id,
      capacity: @train.capacity,
      status: @train.status,
      line_name: @train.line_name,
      time: @train.time,
      weight: @train.weight,
      volume: @train.volume
    }, status: :created
  end

  def render_error_response(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end

  def train_params
    params.permit(
      :train_operator_id,
      :line_id,
      :capacity,
      :status,
      :line_name,
      :time,
      :base_cost_per_unit_distance,
      :additional_cost_factor,
      :distance,
      :weight,
      :volume
    )
  end

  def valid_parcels_assignment_params?
    @train.present? && params[:train_volume].to_i.positive? && params[:parcel_volume].to_i.positive?
  end

  def invalid_best_fit_params?
    params[:parcels].blank? || params[:train_costs].blank?
  end

  def calculate_best_fit_assignment
    parcels = params[:parcels].map(&:to_i).sort { |a, b| b <=> a }
    train_capacities = params[:train_capacities].map(&:to_i).max
    train_costs = params[:train_costs].map(&:to_i)
    train_id = params[:train_id]

    train_assignments = {
      train_id: train_id,
      capacity: train_capacities,
      cost: 0,
      number_of_parcels: parcels.size,
      parcels: []
    }
    parcels.each do |parcel_weight|
      best_fit_train = train_costs.min_by { |cost| calculate_total_cost(cost, parcel_weight) }

      train_assignments[:cost] = calculate_total_cost(best_fit_train, parcel_weight)

      train_assignments[:parcels] << { parcel_weight: parcel_weight }
    end

    train_assignments
  end

  def calculate_total_cost(train_cost, _parcel_weight)
    distance = params[:distance]
    cost_service = CostService.new(distance)
    train = Train.new(base_cost_per_unit_distance: train_cost, additional_cost_factor: train_cost, distance: distance)

    cost_service.calculate_cost(train, distance)
  end
end
