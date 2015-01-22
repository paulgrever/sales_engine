require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'pry'

class CustomersParserTest < Minitest::Test

  def setup
    @file = CSV.open "./fixtures/customers_fixtures.csv", headers: true, header_converters: :symbol
  end

end