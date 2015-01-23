require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items_parser'
require 'csv'
require 'pry'

class InvoiceItemsParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/invoice_items_fixtures.csv"
    @parser = InvoiceItemsParser.new(filename, "parent_klass")
  end

  def test_it_exists
    assert InvoiceItemsParser
  end

  def test_it_creates_array_of_five_invoice_items
    results = parser.parse
    assert_equal 5, results.count
  end

  def test_it_includes_valid_unique_item_id
    results = parser.parse
    verify = results.one? { |invoice_item| invoice_item.item_id =="4"}
    assert verify
  end

  def test_there_are_no_invalid_numbers
    results = parser.parse
    verify = results.one? { |invoice_item| invoice_item == "11"}
    assert verify
  end

  def test_it_does_include_valid_invoice_id
    results = parser.parse
    verify = results.one? { |invoice_item| invoice_item.invoice_id == "3"}
    assert verify
  end

  def test_it_accepts_only_valid_quantity
    results = parser.parse
    verify = results.one? { |invoice_item| invoice_item.quantity =="7"}
    assert verify
  end
end
