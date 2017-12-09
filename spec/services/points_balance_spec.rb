require 'spec_helper'

RSpec.describe PointsBalance do

  describe "calling debit" do
    it "returns the balance" do
      mock_response = double("DebitPointsResponse", body: "{\"kind\":\"points_debit\",\"card_number\":\"12345678\",\"balance\":\"0\"}")
      allow(Typhoeus).to receive(:post).and_return(mock_response)
      expect(PointsBalance.debit('12345678')).to eq('0')
    end
  end

  describe "calling credit" do
    it "returns the balance" do
      mock_response = double("CreditPointsResponse", body: "{\"kind\":\"points_credit\",\"card_number\":\"12345678\",\"balance\":\"300\"}")
      allow(Typhoeus).to receive(:post).and_return(mock_response)
      expect(PointsBalance.debit('12345678')).to eq('300')
    end
  end

end
