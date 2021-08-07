require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) { build(:user, username: 'tutie')  }
    let(:user_two) { build(:user, username: 'tutie')  }

    it 'ensure name presence' do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it 'ensure email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'ensure username presence' do
      user.username = nil
      expect(user.save).to eq(false)
    end

    it 'ensure username unique' do
      expect(user.save).to eq(true)
      expect(user_two.save).to eq(false)
    end
  end
end
