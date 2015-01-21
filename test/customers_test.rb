require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers'
require 'csv'


class CustomersTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = Customers.new("1","Joey","Ondricka","2012-03-27 14:54:09 UTC","2012-03-27 14:54:09 UTC")
  end

  def test_it_exists
    assert Customers
  end

  def test_it_takes_id
    #skip
    assert_equal "1", customers.id
  end

  def test_it_takes_first_name
    #skip
    assert_equal "Joey", customers.first_name
  end

  def test_it_takes_last_name
    #skip
    assert_equal "Ondricka", customers.last_name
  end

  def test_it_was_created_at_certain_date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", customers.created_at
  end

  def test_it_was_updated_at_certain_date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", customers.updated_at
  end


end
