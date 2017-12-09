class GameController < ApplicationController
  def index
  end

  def validate
    card_validity = CardValidator.validate(params[:card_number])

    if card_validity
      @card_number = params[:card_number]
      redirect_to action: 'index', locals: { card_number: @card_number }
    else
      flash[:notice] = "Invalid card number"
      redirect_to action: 'index'
    end
  end

  def play
    die_roll = Dice.roll
    winner = Dice.win?(die_roll)

    final_balance = nil
    if winner
      final_balance = PointsBalance.credit(@card_number)
    else
      final_balance = PointsBalance.debit(@card_number)
    end

    redirect_to action: 'index', locals: { card_number: @card_number, die_roll: die_roll, balance: final_balance }
  end

end
