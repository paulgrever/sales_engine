require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers_parser'
require 'csv'
require 'pry'

class CustomersParserTest < Minitest::Test
  attr_reader :parse

  def setup
    @file = CSV.open "test/fixtures/customers_fixtures.csv", headers: true, header_converters: :symbol
    @parse = CustomersParser.new(@file, "parent_class")
  end


end