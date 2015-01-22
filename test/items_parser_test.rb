require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_parser'
require 'csv'
require 'pry'

class ItemsParserTest < Minitest::Test
  attr_reader :parse

  def setup
    @file = CSV.open "test/fixtures/customers_fixtures.csv", headers: true, header_converters: :symbol
    @parse = ItemsParser.new(@file, "parent_class")
  end


end
