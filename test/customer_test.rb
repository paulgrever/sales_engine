require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require_relative '../lib/sales_engine'
require 'csv'


class CustomerTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = Customer.new("1","Joey","Ondricka","2012-03-27 14:54:09 UTC","2012-03-27 14:54:09 UTC", "parent")
  end

  def test_it_exists
    assert Customer
  end

  def test_it_takes_id
    assert_equal "1", customers.id
  end

  def test_it_takes_first_name
    assert_equal "Joey", customers.first_name
  end

  def test_it_takes_last_name
    assert_equal "Ondricka", customers.last_name
  end

  def test_it_was_created_at_certain_date
    assert_equal "2012-03-27 14:54:09 UTC", customers.created_at
  end

  def test_it_was_updated_at_certain_date
    assert_equal "2012-03-27 14:54:09 UTC", customers.updated_at
  end

end



