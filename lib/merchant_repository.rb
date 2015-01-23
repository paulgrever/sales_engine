require 'csv'
require './lib/merchant_parser'
require 'pry'
class MerchantRepository
  attr_reader :parent_engine, :all_merchant_list

  def initialize(filename, parent_engine)
    @all_merchant_list = MerchantsParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_name(input_name)
    merchants.find {|merchant| merchant.name == input_name }
  end

  def find_by_id(input_id)
    merchants.find {|merchant| merchant.id == input_id }
  end

  def find_all_by_name(input_name)
    merchants.find_all {|merchant| merchant.name == input_name }
  end

  def find_all_by_id(input_id)
    merchants.find_all {|merchant| merchant.id == input_id}
  end
  def merchants
    all_merchant_list.parse
  end


#   attr_reader :merchant_array, :parent_class

#   def initialize(filename, parent_class)
#     @parent_class = parent_class
#   end

#   def create_merchants
#     merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
#     @merchant_array = merchants.map do |merchant|
#       id = merchant[:id]
#       name = merchant[:name]
#       created_at = merchant[:created_at]
#       updated_at = merchant[:updated_at]
#       Merchant.new(id, name, created_at, updated_at, parent_class)
#     end
#     @merchant_array
#   end

#   def all
#     @merchant_array.each do |merch|
#        "ID:#{merch.id}, Name:#{merch.name}, Created Date:#{merch.created_at}, Last Updated: #{merch.updated_at}"
#     end
#     @merchant_array
#   end

#   def random
#     rando = @merchant_array.sample
#        "ID:#{rando.id}, Name:#{rando.name}, Created Date:#{rando.created_at}, Last Updated: #{rando.updated_at}"
#   end

end
# parent_class = "test"
# filename = "test/fixtures/merchants_fixtures.csv"
# test = MerchantRepository.new(filename, parent_class)
# merchs = test.merchants
# binding.pry
