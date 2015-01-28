require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'
require 'csv'
require 'pry'
class SalesEngineTest < Minitest::Test
  attr_reader :setup
  def setup
    @setup = SalesEngine.new
  end

  def test_it_take_customers_repo
    results = setup.customer_repository
    assert results
  end

  def test_it_can_find_customer_by_id
    results = setup.customer_repository.find_by_id(1)
    assert_equal "Joey", results.first_name
  end

  def test_it_can_find_customer_by_id
    results = setup.customer_repository.find_by_id(1)
    assert_equal "Joey", results.first_name
  end

  def test_it_can_find_customer_by_name
    #this uses the real data
    skip
    results = setup.customer_repository.find_by_first_name("Carolyn")
    assert_equal 613, results.id
  end

  def test_it_can_find_merchant
    results = setup.merchant_repository.find_by_name("Cummings-Thiel")
    results = 4, results.id
  end

  def test_it_can_find_items
    results = setup.item_repository.find_by_unit_price(670.76)
    assert_equal 2, results.id
  end

end