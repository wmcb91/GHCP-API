require 'rails_helper'

RSpec.describe Profile do
  it 'is a profile' do
    expect(Profile.new).to be_a(Profile)
  end

  describe 'validations' do
    def valid_params
      { given_name: 'Dround',
        surname: 'TheMan',
        dob: '1992-01-02',
        state: 'MA' }
    end

    it 'validates the presence of an profile\'s given_name,
    surname, dob, and state' do
      expect(Profile.create(valid_params)).to be_valid
    end

    describe 'given_name' do
      it 'is invalid without surname' do
        invalid_params = valid_params.select { |key, _| key == :given_name }
        expect(Profile.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without surname' do
        invalid_params = valid_params.select { |key, _| key == :surname }
        expect(Profile.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without dob' do
        invalid_params = valid_params.select { |key, _| key == :dob }
        expect(Profile.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without state' do
        invalid_params = valid_params.select { |key, _| key == :state }
        expect(Profile.create(invalid_params)).to be_invalid
      end
    end
  end

  describe 'rounds association' do
    def rounds_association
      described_class.reflect_on_association(:rounds)
    end

    it 'has the name rounds' do
      expect(rounds_association).to_not be_nil
      expect(rounds_association.name).to eq(:rounds)
    end

    it 'has a set inverse of record' do
      expect(rounds_association.options[:inverse_of]).to_not be_nil
      expect(rounds_association.options[:inverse_of]).to eq(:profile)
    end

    it 'deletes associated rounds when destroyed' do
      expect(rounds_association.options[:dependent]).to eq(:destroy)
    end
  end
end
