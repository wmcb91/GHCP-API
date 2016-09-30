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

    it 'validates the presence of an round\'s course, date,
    rating, slope, par and score' do
      expect(Round.create(valid_params)).to be_valid
    end

    describe 'course' do
      it 'is invalid without course' do
        invalid_params = valid_params.select { |key, _| key == :course }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'date' do
      it 'is invalid without date' do
        invalid_params = valid_params.select { |key, _| key == :date }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'rating' do
      it 'is invalid without rating' do
        invalid_params = valid_params.select { |key, _| key == :rating }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'slope' do
      it 'is invalid without slope' do
        invalid_params = valid_params.select { |key, _| key == :slope }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'par' do
      it 'is invalid without par' do
        invalid_params = valid_params.select { |key, _| key == :par }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end

    describe 'score' do
      it 'is invalid without score' do
        invalid_params = valid_params.select { |key, _| key == :score }
        expect(Round.create(invalid_params)).to be_invalid
      end
    end
  end

  describe 'profile association' do
    def profile_association
      described_class.reflect_on_association(:profile)
    end

    it 'has the name profile' do
      expect(profile_association).to_not be_nil
      expect(profile_association.name).to eq(:profile)
    end

    it 'has a set inverse of record' do
      expect(profile_association.options[:inverse_of]).to_not be_nil
      expect(profile_association.options[:inverse_of]).to eq(:round)
    end
  end
end
