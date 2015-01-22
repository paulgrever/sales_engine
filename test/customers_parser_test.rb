require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers_parser'
require 'csv'
require 'pry'

class CustomersParserTest < Minitest::Test
  attr_reader :parse

  def setup
    filename = "test/fixtures/customers_fixtures.csv"
    @parse = CustomersParser.new(filename, "parent_class")
  end

  def test_it_exists
    assert CustomersParser
  end

  def test_it_creates_an_array_with_five_customers
    results = parse.parse
    assert_equal 5, results.count
  end

  def test_it_includes_valid_unique_id_numbers
    results = parse.parse
    verify = results.one? {|customer| customer.id == "3"}
    assert verify
  end

  def test_it_does_not_include_valid_numbers
    results = parse.parse
    verify = results.one? {|customer| customer.id == "7"}
    refute verify
  end

  def test_it_does_include_valid_last_names
    results = parse.parse
    verify = results.one? {|customer|  customer.last_name == "Braun"}
    assert verify
  end


end