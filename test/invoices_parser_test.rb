require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoices_parser'
require 'csv'
require 'pry'

class InvoicesParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/invoices_fixtures.csv"
    @parser = InvoicesParser.new(filename, "parent_klass")
  end

  def test_it_exists
    assert InvoicesParser
  end

  def test_it_creates_array_having_five_invoices
    results = parser.parse
    assert_equal 5, results.count
  end

  def test_it_includes_valid_unique_id_number
    results = parser.parse
    verify = results.one? { |invoice| invoice.id == "1"}
    assert verify
  end

  def test_it_does_not_include_valid_numbers
    results=parser.parse
    verify = results.one? { |invoice| invoice.id == "9"}
    refute verify
  end

  def test_it_accepts_only_valid_customer_id
    results = parser.parse
    verify = results.one? { |invoice| invoice.customer_id == "1"}
  end

end
