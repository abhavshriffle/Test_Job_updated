require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'associations' do
    it { should belong_to(:train_operator) }
    it { should belong_to(:line) }
  end
end
