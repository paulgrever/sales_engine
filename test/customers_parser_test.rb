require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers_parser'
require 'csv'
require 'pry'

class CustomersParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/customers.csv"
    @parser = CustomersParser.new(filename, "parent_class")
  end

  def test_it_exists
    assert CustomersParser
  end

  def test_it_creates_an_array_with_five_customers
    results = parser.parse
    assert_equal 5, results.count
  end

  def test_it_includes_valid_unique_id_numbers
    results = parser.parse
    verify = results.one? {|customer| customer.id == 3}
    assert verify
  end

  def test_it_does_not_include_valid_numbers
    results = parser.parse
    verify = results.one? {|customer| customer.id == 7}
    refute verify
  end

  def test_it_does_include_valid_last_names
    results = parser.parse
    verify = results.one? {|customer|  customer.last_name == "Braun"}
    assert verify
  end

  def test_it_accepts_only_valid_first_names
    results = parser.parse
    verify = results.one? { |customer| customer.first_name == "Joey"}
    assert verify
  end
end


