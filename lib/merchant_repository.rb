require 'csv'
require 'pry'
require './lib/merchant'

class MerchantRepository

  def create_merchants
    merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
    @merchant_array = merchants.map do |merchant|
      id = merchant[:id]
      name = merchant[:name]
      created_at = merchant[:created_at]
      updated_at = merchant[:updated_at]
      Merchant.new(id, name, created_at, updated_at)
    end
    @merchant_array
  end

  def all_merchants
    @merchant_array.each do |merch|
      puts "ID:#{merch.id}, Name:#{merch.name}, Created Date:#{merch.created_at}, Last Updated: #{merch.updated_at}"
    end
    @merchant_array
  end

end

# test = MerchantRepository.new
# john = test.create_merchants
# p
# john.each do |merch|
#    puts merch.id.class
#    puts "ID Number #{merch.id} is #{merch.name}they were created on #{merch.created_at} last updated at #{merch.updated_at}"
# end
