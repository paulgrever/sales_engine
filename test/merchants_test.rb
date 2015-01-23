require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require 'csv'


class MerchantTest < Minitest::Test
  attr_reader :merchant

  def setup
    @merchant = Merchant.new("1","Paul", "09/20", "09/21", "parent_class")
  end

  def test_it_exists
    assert Merchant
  end

  def test_it_takes_id
    assert_equal "1", merchant.id
  end

  def test_it_takes_name
    assert_equal "Paul", merchant.name
  end

  def test_it_takes_created_at_date
    assert_equal "09/20", merchant.created_at
  end

  def test_it_takes_updated_at_date
    assert_equal "09/21", merchant.updated_at
  end

  def test_it_can_take_multiple_values
    double = "#{merchant.id},#{merchant.name}"
    assert_equal "1,Paul", double
  end
end