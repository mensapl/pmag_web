require 'rails_helper'

RSpec.describe Activity::Create, type: :service do
  describe '#call' do
    let!(:creator) { User.create! }

    let(:title) { 'Atrakcja' }
    let(:description) { 'Opis atrakcji' }
    let(:time_int) { Time.now.to_i }
    let(:start_time) { Time.at(time_int) }
    let(:end_time) { Time.at(time_int)+2.hours }

    let(:form) do
      {
        title: title,
        description: description,
        start_time: start_time,
        end_time: end_time
      }
    end

    subject { described_class.call(creator, form) }

    it { is_expected.to be_success }

    it 'creates a new activity' do
      activity = subject.value
      expect(activity).to be_persisted
    end

    it 'creates a activity with correct attributes', :aggregate_failures do
      activity = subject.value
      expect(activity.title).to eq(title)
      expect(activity.description).to eq(description)
      expect(activity.start_time).to eq(start_time)
      expect(activity.end_time).to eq(end_time)
      expect(activity.accepted).to eq(false)
    end

    context 'validation errors' do
      let(:title) { nil }
      it { is_expected.to_not be_success }
    end
  end
end
