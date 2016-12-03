require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  describe '/api/me/company' do
    let!(:user) { User.create!(email: 'qwe@qwe.qwe', password: 'qweqweqwe') }
    let!(:access_token) { Doorkeeper::AccessToken.create!(resource_owner_id: user.id) }
    let!(:headers) { { 'Authorization' => "Bearer #{access_token.token}" } }

    let!(:activity) { Activity.create!(accepted: true) }

    let(:url) { '/api/v1/activities' }
    let(:activity_url) { "#{url}/#{activity.id}" }

    describe 'GET' do
      it 'returns activities list', :aggregate_failures do
        get url, headers: headers
        expect(response).to be_successful
        expect(response.parsed_body.size).to eq(1)
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
