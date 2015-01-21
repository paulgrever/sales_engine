class MerchantRepository
  attr_reader :entries

  def initialize
    merchant_repo = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def all
    entries
  end

  def random
    entries.sample
  end

  def find_by_X(match) #"like Mary/mary but not mary ellen"
    entries.find_by
  end

  def find_all_by_X(match)
    #entries.select
  end

  def items
    #entries.select
  end

  def invoices

  end

  def most_revenue

  end

  def most_items

  end

  def revenue(date)

  end

end


require 'csv'
require './lib/merchant'

class MerchantRepository

  def create_merchants
    merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
    merchant_array = merchants.map do |merchant|
      id = merchant[:id]
      name = merchant[:name]
      created_at = merchant[:created_at]
      updated_at = merchant[:updated_at]
      Merchant.new(id, name, created_at, updated_at)
    end
    merchant_array
  end

end

test = MerchantRepository.new
john = test.create_merchants
p
john.each do |merch|
   puts merch.id.class
   puts "ID Number #{merch.id} is #{merch.name}\n
    they were created on #{merch.created_at} \n
    last updated at #{merch.updated_at}"
end
