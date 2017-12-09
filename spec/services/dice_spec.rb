require 'spec_helper'

RSpec.describe Dice do

  describe "roll" do
    it "returns a integer between 1 and 6" do
      expect(Dice.roll).to be_between(1,6)
    end
  end

  describe "win?" do
    context "when an even number has been rolled" do
      it "returns true" do
        expect(Dice.win?(2)).to eq(true)
      end
    end

    context "when an odd number has been rolled" do
      it "returns false" do
        expect(Dice.win?(1)).to eq(false)
      end
    end
  end

end
