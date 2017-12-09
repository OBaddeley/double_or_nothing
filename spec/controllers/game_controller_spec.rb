require 'spec_helper'

RSpec.describe GameController do

  describe "#index" do
    it "renders the correct template" do
      expect(get :index).to render_template(:index)
    end
  end

  describe "#validate" do
    it "redriects to index" do
      allow(CardValidator).to receive(:validate).and_return(true)
      expect(get :validate, params: {card_number: '12345678'}).to redirect_to('http://test.host/game/index?locals%5Bcard_number%5D=12345678')
    end
  end

  describe "#play" do
    it "redriects to index" do
      allow(Dice).to receive(:roll).and_return(2)
      allow(PointsBalance).to receive(:credit).and_return('10')
      expect(get :play, params: {card_number: '12345678'}).to  redirect_to('http://test.host/game/index?locals%5Bbalance%5D=10&locals%5Bcard_number%5D=&locals%5Bdie_roll%5D=2')
    end
  end

end
