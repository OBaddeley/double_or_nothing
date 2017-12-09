require 'typhoeus'

module PointsBalance

  #The endpoint called here will debit the points balance to zero.
  #The endpoint will get the balance based on the card number, debit the balance,
  #then return the new balance
  #e.g. { 'kind': 'points_debit',
          # 'card_number': '12345678',
          # 'balance': '0'
        # }
  def self.debit(card_number)
    path = full_path('/balance_debit/:card_number', card_number)
    result = Typhoeus.post(path)
    data = JSON.parse(result.body)
    data["balance"]
  end

  #The endpoint called here will credit the points balance to zero.
  #The endpoint will get the balance based on the card number, double the balance,
  #then return the new balance
  #e.g. { 'kind': 'points_credit',
          # 'card_number': '12345678',
          # 'balance': '300'
        # }
  def self.credit(card_number)
    path = full_path('/balance_credit/:card_number', card_number)
    result = Typhoeus.post(path)
    data = JSON.parse(result.body)
    data["balance"]
  end

  private

  def self.full_path(endpoint, card_number)
    endpoint.gsub(":card_number", card_number.to_s)
  end

end
