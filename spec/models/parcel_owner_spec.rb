require 'rails_helper'

RSpec.describe ParcelOwner, type: :model do
  describe 'associations' do
    it { should have_many(:parcels) }
  end
end
