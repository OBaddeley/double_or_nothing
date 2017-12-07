require 'typhoeus'

module CardValidator

  def self.validate(card_number)
    path = full_path('/validate/:card_number', card_number)
    result = Typhoeous.get(path)
    data = JSON.parse(result)
    data[:card_number] ? true : false
  end

  private

  def self.full_path(endpoint, card_number)
    endpoint.gsub(":card_number", card_number.to_s)
  end

end
