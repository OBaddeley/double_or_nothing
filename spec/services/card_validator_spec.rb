require 'spec_helper'

RSpec.describe CardValidator do

  context "when the card number is valid" do
    it "returns true" do
      mock_response = double("CardValidatorResponse", body: "{\"card_number\":\"12345678\"}")
      allow(Typhoeus).to receive(:get).and_return(mock_response)
      expect(CardValidator.validate('12345678')).to eq(true)
    end
  end

  context "when the card number is not valid" do
    it "returns false" do
      mock_response = double("CardValidatorResponse", body: "{}")
      allow(Typhoeus).to receive(:get).and_return(mock_response)
      expect(CardValidator.validate('12345678')).to eq(false)
    end
  end

end
