require 'rails_helper'

RSpec.describe 'Profiles API' do
  def profile_params
    {
      given_name: 'alice',
      surname: 'cooper',
      dob: '1992-01-02',
      state: 'massachusetts'
    }
  end

  def profiles
    Profile.all
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

  describe 'GET /profiles' do
    it 'lists all profiles' do
      get '/profiles'

      expect(response).to be_success

      profiles_response = JSON.parse(response.body)
      expect(profiles_response.length).to eq(profiles.count)
      expect(profiles_response.first['given_name']).to eq(profile[:given_name])
    end
  end

  describe 'GET /profiles/:id' do
    it 'shows one profile' do
      get "/profiles/#{profile.id}"

      expect(response).to be_success

      profile_response = JSON.parse(response.body)
      expect(profile_response['id']).not_to be_nil
      expect(profile_response['given_name']).to eq(profile[:given_name])
    end
  end

  describe 'POST /profiles' do
    it 'creates an profile' do
      post '/profiles', profile: profile_params, format: :json

      expect(response).to be_success

      profile_response = JSON.parse(response.body)
      expect(profile_response).not_to be_nil
      expect(profile_response['given_name']).to eq(profile_params[:given_name])
    end
  end

  describe 'PATCH /profiles/:id' do
    def profile_diff
      { given_name: 'charlie' }
    end

    it 'updates an profile' do
      patch "/profiles/#{profile.id}", profile: profile_diff, format: :json

      expect(response).to be_success

      profile_response = JSON.parse(response.body)
      expect(profile_response['id']).to eq(profile[:id])
      expect(profile_response['given_name']).to eq(profile_diff[:given_name])
    end
  end

  describe 'DELETE /profiles/:id' do
    it 'deletes an profile' do
      delete "/profiles/#{profile.id}"

      expect(response).to be_success
      expect(response.body).to be_empty
    end
  end
end
