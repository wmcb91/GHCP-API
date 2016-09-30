require 'rails_helper'

RSpec.describe ProfilesController do
  def profile_params
    {
      given_name: 'alice',
      surname: 'cooper',
      dob: '1992-01-02',
      state: 'massachusetts'
    }
  end

  def profile
    Profile.first
  end

  before(:all) do
    Profile.create!(profile_params)
  end

  after(:all) do
    Profile.delete_all
  end

  describe 'GET index' do
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      profiles_collection = JSON.parse(response.body)
      expect(profiles_collection).not_to be_nil
      expect(profiles_collection.first['given_name']).to eq(profile.given_name)
    end
  end

  describe 'GET show' do
    before(:each) { get :show, id: profile.id }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      profile_response = JSON.parse(response.body)
      expect(profile_response).not_to be_nil
      puts 'profile response is'
      puts profile_response
    end

    it 'renders a hash' do
      profile_response = JSON.parse(response.body)
      expect(profile_response).to a_kind_of(Hash)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, profile: profile_params, format: :json
    end

    it 'is successful' do
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      profile_response = JSON.parse(response.body)
      expect(profile_response).not_to be_nil
      expect(profile_response['given_name']).to eq(profile.given_name)
    end
  end

  describe 'PATCH update' do
    def profile_diff
      { surname: 'henderson' }
    end

    before(:each) do
      patch :update, id: profile.id, profile: profile_diff, format: :json
    end

    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      profile_response = JSON.parse(response.body)
      expect(profile_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
      delete :destroy, id: profile.id

      expect(response.status).to eq(204)
      expect(response.body).to be_empty
    end
  end
end
