#question about customer duplication

require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require 'pry'
require 'csv'


class CustomerTest < Minitest::Test
  attr_reader :customer

  def setup
    @customer = Customer.new()
  end

  def test_it_exists
    assert Customer
  end

  def test_it_takes_id
    skip
  end

end
  # id,first_name,last_name,created_at,updated_at
  # 1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
  # 2,Cecelia,Osinski,2012-03-27 14:54:10 UTC,2012-03-27 14:54:10 UTC
