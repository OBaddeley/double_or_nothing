require 'typhoeus'

module CardValidator

  #The endpoint called here will check the backend systems
  # to see if the card number passed to it, exists.
  # If it does exist it will return the card number
  # e.g.{ 'card_number': '12345678' }

  def self.validate(card_number)
    path = full_path('/validate/:card_number', card_number)
    result = Typhoeus.get(path)
    data = JSON.parse(result.body)
    data["card_number"] ? true : false
  end

  private

  def self.full_path(endpoint, card_number)
    endpoint.gsub(":card_number", card_number.to_s)
  end

end
