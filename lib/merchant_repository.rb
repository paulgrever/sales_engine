<<<<<<< HEAD
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

  end

  def items

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
=======
require 'csv'
require './merchant'

class MerchantRepository

  def create_merchants
    merchants = CSV.open '../data/merchants.csv', headers: true, header_converters: :symbol
    merchants.map do |merchant|
      id = merchant[:id]
      name = merchant[:name]
      created_at = merchant[:created_at]
      updated_at = merchant[:updated_at]
      Merchant.new(id, name, created_at, updated_at)
    end
  end



end

test = MerchantRepository.new
john = test.create_merchants
john.each do |merch|
  puts "ID Number #{merch.id} is #{merch.name} they were created on #{merch.created_at}"
end

>>>>>>> e386f39eb7b33db60542384e6990c0211fb285c5
