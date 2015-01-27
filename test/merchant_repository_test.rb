require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'
require './lib/sales_engine'
require 'csv'
require 'pry'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merch_repo
  def setup 
    filename = "test/fixtures/merchants.csv"
    
    parent_engine = "parent"
    @merch_repo = MerchantRepository.new(filename, parent_engine)
  end

  def test_it_exists
    assert MerchantRepository
  end

  def test_it_contains_all_merchants_objects
    results = merch_repo.all
    assert 6, results.count
  end

  def test_it_contains_all_merchant_objects
    results = merch_repo.all
    assert_equal "Schroeder-Jerde", results.first.name
    assert_equal 3, results[2].id
  end

  def test_it_refutes_data_not_in_CSV
    results = merch_repo.all
    refute results.include?('Paul')
  end

  def test_random_doesnt_repeate_itself_most_of_the_time
    results = merch_repo.random
    results2 = merch_repo.random
    assert_equal false, results == results2
  end


  def test_it_can_find_by_name
    input_name = "Schroeder-Jerde"
    results = merch_repo.find_by_name(input_name)
    assert_equal "Schroeder-Jerde", results.name
  end

  def test_it_can_find_by_name_then_display_other_attributes_associated_with_first_name
    input_name = "Schroeder-Jerde"
    results = merch_repo.find_by_name(input_name)
    assert_equal 1, results.id
    assert_equal "2012-03-27 14:53:59 UTC", results.created_at
  end

  def test_it_can_find_a_differnt_customer_by_first_name
    input_name = "Cummings-Thiel"
    results = merch_repo.find_by_name(input_name)
    assert_equal "Cummings-Thiel", results.name
    assert_equal 4, results.id
  end

  def test_it_can_locate_a_customer_by_id
    input_id = 5
    results = merch_repo.find_by_id(input_id)
    assert_equal "Williamson Group", results.name
  end

  def test_it_can_locate_a_differnt_customer_by_id
    input_id = 4
    results = merch_repo.find_by_id(input_id)
    assert_equal "Cummings-Thiel", results.name
  end

  def test_it_can_find_all_merchants_by_name
    input_name = "Cummings-Thiel"
    results = merch_repo.find_all_by_name(input_name)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_merchants_by_name
    input_name = "Williamson Group"
    results = merch_repo.find_all_by_name(input_name)
    assert_equal 2, results.count
  end


  def test_it_can_find_all_merchants_by_id
    input_id = 6
    results = merch_repo.find_all_by_id(input_id)
    assert_equal 1, results.count
  end

  def test_it_doesnt_find_all_if_it_dont_exist
    input_id = "10"
    results = merch_repo.find_all_by_id(input_id)
    assert_equal 0, results.count
  end

  def test_it_can_find_items_by_merch_id
    skip
    merch_id = "1"
    results = merch_repo.items(merch_id)
    assert_equal 5, results.count
  end


   
end
