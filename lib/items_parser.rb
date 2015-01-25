require './lib/items'
require 'pry'
require 'csv'

class ItemsParser
  attr_reader :parse, :parent_klass

  def initialize(filename, parent_klass)
    @parse = create_items(filename, parent_klass)
  end

  def create_items(filename, parent_klass)
    items = CSV.open "#{filename}", headers: true, header_converters: :symbol
    @items_arr = items.collect do |items|
      id          = items[:id]
      name        = items[:name]
      description = items[:description]
      unit_price  = items[:unit_price]
      merchant_id = items[:merchant_id]
      created_at  = items[:created_at]
      updated_at  = items[:updated_at]

      Invoices.new(id,name,description, unit_price, merchant_id, created_at,updated_at)
    end
  end
end
