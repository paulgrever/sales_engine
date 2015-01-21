#question about customer duplication

require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require 'pry'
require 'csv'


class CustomerTest < Minitest::Test
  attr_reader :customer

  def setup
    @customer = Customer.new("1","Joey","Ondricka","2012-03-27 14:54:09 UTC","2012-03-27 14:54:09 UTC")
  end

  def test_it_exists
    assert Customer
  end

  def test_it_takes_id
    skip
    assert_equal "1", customer.id
  end

  def test_it_takes_first_name
    skip
    assert_equal "Joey", customer.first_name
  end

  def test_it_takes_last_name
    skip
    assert_equal "Ondricka", customer.last_name
  end

  def test_it_was_created_at_certain_date
    skip
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_it_was_updated_at_certain_date
    skip
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end


end
