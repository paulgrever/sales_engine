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
  puts merch.id.class
  # puts "ID Number #{merch.id} is #{merch.name} they were created on #{merch.created_at}"
end

