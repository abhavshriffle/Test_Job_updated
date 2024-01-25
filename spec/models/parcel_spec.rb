require 'rails_helper'

RSpec.describe Parcel, type: :model do
  describe 'associations' do
    it { should belong_to(:parcel_owner).optional }
  end
end
