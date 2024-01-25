require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe 'association' do
    it { should belong_to(:train_operator) }
    it { should belong_to(:parcel) }
  end
end
