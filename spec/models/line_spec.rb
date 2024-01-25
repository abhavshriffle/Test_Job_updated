require 'rails_helper'

RSpec.describe Line, type: :model do
  it { is_expected.to have_one(:train) }
  it { is_expected.to have_many(:offers) }
end
