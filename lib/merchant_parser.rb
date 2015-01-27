require_relative 'merchant'
require 'pry'
require 'csv'
class MerchantsParser
   attr_reader :parse, :parent_class

  def initialize(filename, parent_class)
    @parse = create_merchants(filename, parent_class)
  end

  def create_merchants(filename, parent_class)
    merchants = CSV.open "#{filename}", headers: true, header_converters: :symbol
    merchant_list = merchants.map do |merchant|
      id = merchant[:id].to_i
      name = merchant[:name]
      created_at = merchant[:created_at]
      updated_at = merchant[:updated_at]
      Merchant.new(id, name, created_at, updated_at, parent_class)
    end
  end
end

