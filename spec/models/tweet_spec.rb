require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validation test' do

    let(:tweet) { build(:tweet) }

    it 'ensure text presence' do
      tweet.text = nil

      expect(tweet).to eq(false)
    end

    it 'ensure user owner' do 
      tweet.user_id = nil

      expect(tweet).to eq(false)
    end

    it 'ensure save successfully' do 
      expect(tweet).to eq(true)
    end
  end

end
