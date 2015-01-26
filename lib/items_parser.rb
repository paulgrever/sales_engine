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
    items_arr = items.map do |item|
      id          = item[:id]
      name        = item[:name]
      description = item[:description]
      unit_price  = item[:unit_price]
      merchant_id = item[:merchant_id]
      created_at  = item[:created_at]
      updated_at  = item[:updated_at]

      Items.new(id,name,description, unit_price, merchant_id, created_at,updated_at, parent_klass)
    end
  end
end

