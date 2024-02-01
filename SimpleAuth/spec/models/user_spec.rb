# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    # Add more validations as needed
  end

  describe '#authenticate' do
    let(:user) { create(:user, password: 'password') }

    it 'returns the user when password is correct' do
      expect(user.authenticate('password')).to eq(user)
    end

    it 'returns false when password is incorrect' do
      expect(user.authenticate('wrong_password')).to be false
    end
  end
end
