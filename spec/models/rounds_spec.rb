require 'rails_helper'

RSpec.describe Round do
  it 'is a round' do
    expect(Round.new).to be_a(Round)
  end

  describe 'validations' do
    def valid_params
      {
        course: 'butter brook',
        date: '2016-09-29',
        rating: 72.5,
        slope: 133,
        par: 72,
        score: 85
      }
    end

    it 'validates the presence of an round\'s given_name,
    surname, dob, and state' do
      expect(Round.create(valid_params)).to be_valid
    end

    describe 'given_name' do
      it 'is invalid without surname' do
        invalid_params = valid_params.select { |key, _| key == :given_name }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without given_name' do
        invalid_params = valid_params.select { |key, _| key == :surname }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without given_name' do
        invalid_params = valid_params.select { |key, _| key == :dob }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'surname' do
      it 'is invalid without given_name' do
        invalid_params = valid_params.select { |key, _| key == :state }
        expect(Round.create(invalid_params)).to be_invalid
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
      expect(rounds_association.options[:inverse_of]).to eq(:round)
    end

    it 'deletes associated rounds when destroyed' do
      expect(rounds_association.options[:dependent]).to eq(:destroy)
    end
  end
end
