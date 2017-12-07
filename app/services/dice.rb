module Dice

  def self.roll
    rand(6) + 1
  end

  def self.win?(roll)
    roll.even?
  end

end
