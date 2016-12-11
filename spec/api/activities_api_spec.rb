require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  describe '/api/v1/activities' do
    let!(:user) { User.create!(email: 'qwe@qwe.qwe', password: 'qweqweqwe') }
    let!(:access_token) { Doorkeeper::AccessToken.create!(resource_owner_id: user.id) }
    let!(:headers) { { 'Authorization' => "Bearer #{access_token.token}" } }

    let!(:activity) { Activity.create!(accepted: true) }

    let(:url) { '/api/v1/activities' }
    let(:activity_url) { "#{url}/#{activity.id}" }

    let(:title) { 'Atrakcja' }
    let(:description) { 'Opis atrakcji' }
    let(:start_time) { Time.now }
    let(:end_time) { Time.now + 2.hours }

    let(:response_attributes) { response.parsed_body['data']['attributes'] }

    let(:form) do
      {
        type: 'activities',
        attributes: {
          title: title,
          description: description,
          start_time: start_time,
          end_time: end_time
        }
      }
    end

    describe 'GET' do
      it 'returns activities list', :aggregate_failures do
        get url, headers: headers
        expect(response).to be_successful
        expect(response.parsed_body['data'].first['id']).to eq(activity.id.to_s)
        expect(response.parsed_body.size).to eq(1)
      end
    end

    describe 'POST' do
      subject { post url, params: form, headers: headers }
      it 'returns data for created activity', :aggregate_failures do
        subject
        expect(response).to be_successful
        expect(response.parsed_body['data']['type']).to eq('activities')
        expect(response_attributes['title']).to eq(title)
        expect(response_attributes['description']).to eq(description)
        expect(response_attributes['accepted']).to eq(false)
        # TODO: check times
      end

      context 'invalid form' do
        let(:title) { nil }
        it 'returns errors', :aggregate_failures do
          subject
          expect(response.status).to eq(422)
          expect(response.parsed_body).to have_key('title')
        end
      end
    end

    describe 'GET :id' do
      it 'returns data for specific activity', :aggregate_failures do
        get activity_url, headers: headers
        expect(response).to be_successful
      end
    end
  end
end
