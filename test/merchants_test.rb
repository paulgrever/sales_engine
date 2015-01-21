require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants'
require 'csv'


class MerchantTest < Minitest::Test
  attr_reader :merchants

  def setup
    @merchants = Merchants.new("1","Paul", "09/20", "09/21")
  end

  def test_it_exists
    assert Merchants
  end

  def test_it_takes_id
    assert_equal "1", merchants.id
  end

  def test_it_takes_name
    assert_equal "Paul", merchants.name
  end

  def test_it_takes_created_at_date
    assert_equal "09/20", merchants.created_at
  end

  def test_it_takes_updated_at_date
    assert_equal "09/21", merchants.updated_at
  end

  def test_it_can_take_multiple_values
    double = "#{merchants.id},#{merchants.name}"
    assert_equal "1,Paul", double
  end
end