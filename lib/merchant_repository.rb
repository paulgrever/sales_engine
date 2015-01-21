require 'csv'
require './lib/merchants'
require 'pry'
class MerchantRepository
  attr_reader :merchant_array

  def create_merchants
    merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
    @merchant_array = merchants.map do |merchant|
      id = merchant[:id]
      name = merchant[:name]
      created_at = merchant[:created_at]
      updated_at = merchant[:updated_at]
      Merchants.new(id, name, created_at, updated_at)
    end
    @merchant_array
  end

  def all
    @merchant_array.each do |merch|
      puts "ID:#{merch.id}, Name:#{merch.name}, Created Date:#{merch.created_at}, Last Updated: #{merch.updated_at}"
    end
    @merchant_array
  end

  def random
    rando = @merchant_array.sample
      puts "ID:#{rando.id}, Name:#{rando.name}, Created Date:#{rando.created_at}, Last Updated: #{rando.updated_at}"
  end





end

test = MerchantRepository.new
merchs = test.create_merchants
test.random
