require 'rails_helper'

RSpec.describe Train, type: :model do
  describe 'associations' do
    let(:line) { FactoryBot.create(:line, name: 'LineA') }
    let(:train) { FactoryBot.create(:train, line: line) }

    it { should belong_to(:train_operator).optional }
    it { should belong_to(:line).optional }
    it { should have_many(:bookings) }

    it 'delegates name to line' do
      expect(train.line_name).to eq('LineA')
    end
  end
end
