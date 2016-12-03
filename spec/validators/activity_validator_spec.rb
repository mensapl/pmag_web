require 'rails_helper'

RSpec.describe ActivityValidator, type: :validator do
  let(:title) { 'Atrakcja' }
  let(:description) { 'Opis atrakcji' }
  let(:start_time) { Time.now }
  let(:end_time) { Time.now + 2.hours }

  let(:form) do
    {
      title: title,
      description: description,
      start_time: start_time,
      end_time: end_time
    }
  end

  describe '.validate' do
    subject { described_class.new(form).validate }
    it { is_expected.to be_success }

    context 'invalid title' do
      let(:title) { '' }
      it { is_expected.to_not be_success }

      it 'add title to errors' do
        expect(subject.errors).to have_key(:title)
      end
    end

    context 'invalid description' do
      let(:description) { '' }
      it { is_expected.to_not be_success }

      it 'add description to errors' do
        expect(subject.errors).to have_key(:description)
      end
    end

    context 'invalid start_time' do
      let(:start_time) { 'notatime' }
      it { is_expected.to_not be_success }

      it 'add start_time to errors' do
        expect(subject.errors).to have_key(:start_time)
      end
    end

    context 'invalid title' do
      let(:end_time) { 'notatime' }
      it { is_expected.to_not be_success }

      it 'add end_time to errors' do
        expect(subject.errors).to have_key(:end_time)
      end
    end
  end
end
