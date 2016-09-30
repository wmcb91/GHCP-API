require 'rails_helper'

RSpec.describe RoundsController do
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

  def round
    Round.first
  end

  before(:all) do
    Round.create!(round_params)
  end

  after(:all) do
    Round.delete_all
  end

  describe 'GET index' do
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      rounds_collection = JSON.parse(response.body)
      expect(rounds_collection).not_to be_nil
      expect(rounds_collection.first['course']).to eq(round.course)
    end
  end

  describe 'GET show' do
    before(:each) { get :show, id: round.id }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      round_response = JSON.parse(response.body)
      expect(round_response).not_to be_nil
      puts 'round response is'
      puts round_response
    end

    it 'renders a hash' do
      round_response = JSON.parse(response.body)
      expect(round_response).to a_kind_of(Hash)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, round: round_params, format: :json
    end

    it 'is successful' do
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      round_response = JSON.parse(response.body)
      expect(round_response).not_to be_nil
      expect(round_response['course']).to eq(round.course)
    end
  end

  describe 'PATCH update' do
    def round_diff
      { score: 82 }
    end

    before(:each) do
      patch :update, id: round.id, round: round_diff, format: :json
    end

    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      round_response = JSON.parse(response.body)
      expect(round_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      delete :destroy, id: round.id

      expect(response.status).to eq(204)
      expect(response.body).to be_empty
    end
  end
end
