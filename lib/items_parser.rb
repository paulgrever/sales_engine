require_relative 'items'
require 'pry'
require 'csv'
require 'bigdecimal'

class ItemsParser
  attr_reader :parse, :parent_klass

  def initialize(filename, parent_klass)
    @parse = create_items(filename, parent_klass)
  end

  def create_items(filename, parent_klass)
    items = CSV.open "#{filename}", headers: true, header_converters: :symbol
    items_arr = items.map do |item|
      id          = item[:id].to_i
      name        = item[:name]
      description = item[:description]
      unit_price  = price_converter(item[:unit_price])
      merchant_id = item[:merchant_id].to_i
      created_at  = item[:created_at]
      updated_at  = item[:updated_at]

      Items.new(id,name,description, unit_price, merchant_id, created_at,updated_at, parent_klass)
    end
  end

  def price_converter(unit_price)
    price = BigDecimal.new(unit_price)
  end
end

