require 'rails_helper'

RSpec.describe TrainOperator, type: :model do
  it { should have_many(:trains) }
  it { should have_many(:offers) }
end
