require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transactions_parser'
require 'csv'
require 'pry'

class TransactionsParserTest < Minitest::Test
  attr_reader :parser

  def setup
    filename = "test/fixtures/transactions_fixtures.csv"
    @parser = TransactionsParser.new(filename, "parent_class")
  end

  def test_it_exists
    assert TransactionsParser
  end

  def test_it_creates_array_of_five_examples
    results = parser.parse
    assert_equal 5, results.count
  end

  def test_it_includes_valid_unique_id_num
    results = parser.parse
    verify = results.one? { |transaction| transaction.id == "1"}
    assert verify
  end

  def test_it_does_not_include_invalid_num
    results = parser.parse
    verify = results.one? { |transaction| transaction.id == "14"}
    refute verify
  end

  def test_it_accepts_only_valid_invoice_id
    results = parser.parse
    verify = results.one? { |transaction|  transaction.invoice_id == "2"}
    assert verify
  end

  def test_it_includes_valid_credit_card_number
    results = parser.parse
    verify = results.one? {|transaction| transaction.credit_card_number =="4654405418249632"}
    assert verify
  end

end
