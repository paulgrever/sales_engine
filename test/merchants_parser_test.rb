require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_parser'
require 'csv'
require 'pry'

class MerchantsParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/merchants.csv"
    @parser = MerchantsParser.new(filename, "parent_class")
  end

  def test_it_exists
    assert MerchantsParser
  end

  def test_it_creates_an_array_with_five_merchants
    results = parser.parse
    assert_equal 6, results.count
  end

  def test_it_includes_valid_unique_id_numbers
    results = parser.parse
    verify = results.one? {|merchant| merchant.id == 3}
    assert verify
  end

  def test_it_does_not_include_valid_numbers
    results = parser.parse
    verify = results.one? {|merchant| merchant.id == 7}
    refute verify
  end

  def test_it_does_include_valid_names
    results = parser.parse
    verify = results.one? {|merchant|  merchant.name == "Willms and Sons"}
    assert verify
  end

  def test_it_accepts_only_valid_names
    results = parser.parse
    verify = results.one? { |merchant| merchant.name == "Cummings-Thiel"}
    assert verify
  end
end
