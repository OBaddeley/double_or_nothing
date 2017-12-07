require 'typhoeus'

module PointsBalance

  def self.debit(card_number)
    path = full_path('/balance_debit/:card_number', card_number)
    result = Typhoeous.post(path)
    data = JSON.parse(result)
    data[:balance]
  end

  def self.credit(card_number)
    path = full_path('/balance_credit/:card_number', card_number)
    result = Typhoeous.post(path)
    data = JSON.parse(result)
    data[:balance]
  end

  private

  def self.full_path(endpoint, card_number)
    endpoint.gsub(":card_number", card_number.to_s)
  end

end
