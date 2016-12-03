require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { is_expected.to belong_to :creator }

  describe '#created_by' do
    let!(:creator) { User.create!(email: 'qwe@qwe.qwe', password: 'qweqwe') }
    let!(:activity_by_creator) { described_class.create!(creator: creator) }
    let!(:other_activity)  { described_class.create! }

    it 'returns activities created by that user' do
      expect(described_class.created_by(creator.id)).to include(activity_by_creator)
    end

    it 'doesnt return activities created by other users' do
      expect(described_class.created_by(creator.id)).to_not include(other_activity)
    end
  end
end
