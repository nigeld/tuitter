require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validation test' do
    let(:tweet) { build(:tweet) }

    it 'ensure text presence' do
      tweet.text = nil
      expect(tweet.save).to eq(false)
    end

    it 'ensure text dont exceed 280' do
      tweet.text = Faker::Lorem.paragraph_by_chars(number: 281, supplemental: false)
      expect(tweet.save).to eq(false)
    end

    it 'ensure user owner' do 
      tweet.user = nil
      expect(tweet.save).to eq(false)
    end

    it 'ensure save successfully' do 
      expect(tweet.save).to eq(true)
    end
  end

end
