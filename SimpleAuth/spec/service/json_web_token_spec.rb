require 'rails_helper'

RSpec.describe JsonWebToken do
  describe '.encode' do
    let(:payload) { { user_id: 1 } }

    it 'encodes the payload into a JWT token' do
      token = described_class.encode(payload)
      expect(token).not_to be_nil
    end
  end

  describe '.decode' do
    let(:payload) { { user_id: 1 } }
    let(:token) { described_class.encode(payload) }

    it 'decodes the JWT token into the original payload' do
      decoded_payload = described_class.decode(token)
      expect(decoded_payload).to eq(payload)
    end

    context 'when decoding an invalid token' do
      let(:invalid_token) { 'invalid_token' }

      it 'returns nil' do
        decoded_payload = described_class.decode(invalid_token)
        expect(decoded_payload).to be_nil
      end
    end
  end
end
