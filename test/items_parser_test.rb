require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_parser'
require 'csv'
require 'pry'

class ItemsParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/items_fixtures.csv"
    @parser = ItemsParser.new(filename, "parent_class")
  end

  def test_it_exists
    assert ItemsParser
  end

  def test_it_makes_array_with_five_items
    results = parser.parse
    assert_equal 5, results.count
  end

  def test_it_only_takes_integers_for_unit_price
    skip
    results = parser.parse
    verify = results.is_a?(Integer)
    assert verify
  end

  def test_it_includes_valid_id
    results = parser.parse
    verify = results.one? { |item| item.id == "1"}
    assert verify
  end

  def test_it_does_not_include_valid_id_numbers
    results = parser.parse
    verify = results.one? { |item| item.id == "9"}
    refute verify
  end

  def test_it_includes_valid_names
    skip
    results = parser.parse
    verify = results.one? { |item| name == "Item Qui Esse"}
    assert verify
  end

  def test_it_includes_valid_unit_prices
    skip
    results = parser.parse
    verify = results.one? { |item| item.unit_price == 75107}
  end
end
