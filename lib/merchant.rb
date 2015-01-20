require 'csv'

class Merchant

  def initialize
    merchant = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
  end
  
end

