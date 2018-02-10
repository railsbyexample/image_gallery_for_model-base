require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = create :user
    expect(user).to be_valid
  end

  describe 'validations' do
    it 'is invalid with an existing email' do
      user1 = create :user
      user2 = build :user, email: user1.email

      expect(user2).to be_invalid
    end
  end
end
