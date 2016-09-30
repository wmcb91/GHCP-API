require 'rails_helper'

RSpec.describe 'Rounds API' do
  def round_params
    {
      course: 'butter brook',
      date: '2016-09-29',
      rating: 72.5,
      slope: 133,
      par: 72,
      score: 85
    }
  end

  def rounds
    Round.all
  end

  def round
    Round.first
  end

  before(:all) do
    Round.create!(round_params)
  end

  after(:all) do
    Round.delete_all
  end

  describe 'GET /rounds' do
    it 'lists all rounds' do
      get '/rounds'

      expect(response).to be_success

      rounds_response = JSON.parse(response.body)
      expect(rounds_response.length).to eq(rounds.count)
      expect(rounds_response.first['title']).to eq(round[:title])
    end
  end

  describe 'GET /rounds/:id' do
    it 'shows one round' do
      get "/rounds/#{round.id}"

      expect(response).to be_success

      round_response = JSON.parse(response.body)
      expect(round_response['id']).not_to be_nil
      expect(round_response['title']).to eq(round[:title])
    end
  end

  describe 'POST /rounds' do
    it 'creates an round' do
      post '/rounds', round: round_params, format: :json

      expect(response).to be_success

      round_response = JSON.parse(response.body)
      expect(round_response).not_to be_nil
      expect(round_response['title']).to eq(round_params[:title])
    end
  end

  describe 'PATCH /rounds/:id' do
    def round_diff
      { score: 83 }
    end

    it 'updates an round' do
      patch "/rounds/#{round.id}", round: round_diff, format: :json

      expect(response).to be_success

      round_response = JSON.parse(response.body)
      expect(round_response['id']).to eq(round[:id])
      expect(round_response['title']).to eq(round_diff[:title])
    end
  end

  describe 'DELETE /rounds/:id' do
    it 'deletes an round' do
      delete "/rounds/#{round.id}"

      expect(response).to be_success
      expect(response.body).to be_empty
    end
  end
end
