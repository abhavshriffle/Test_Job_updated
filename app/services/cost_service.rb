class CostService
  def initialize(distance)
    @distance = distance
  end

  def calculate_cost(train, distance)
    base_cost = train.base_cost_per_unit_distance * distance
    additional_cost = train.additional_cost_factor * distance
    total_cost = base_cost + additional_cost
    total_cost.round(2)
  end
end
