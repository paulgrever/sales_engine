require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'
require 'csv'
require 'pry'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :cust_repo 
  def setup 
    filename = "test/fixtures/customers_fixtures.csv"
    parent_engine = "parent"
    @cust_repo = CustomerRepository.new(filename, parent_engine)
  end

  def test_it_exists
    assert CustomerRepository
  end

  def test_it_contains_all_customers_objects
    results = cust_repo.all
    assert 5, results.count
  end

  def test_it_contains_all_customer_objects
    results = cust_repo.all
    assert_equal "Joey", results.first.first_name
    assert_equal "Nader", results.last.last_name
    assert_equal "3", results[2].id
  end

  def test_it_refutes_data_not_in_CSV
    results = cust_repo.all
    refute results.include?('Paul')
  end

  def test_random_doesnt_repeate_itself_most_of_the_time
    results = cust_repo.random
    results2 = cust_repo.random
    assert_equal false, results == results2
  end

  def test_random_selects_a_customer_from_csv_list
    skip
    results = cust_repo.random
    verify = cust_repo.all_customer_list.include?(results)
    assert verify
  end

  def test_it_can_find_by_first_name
    input_name = "Joey"
    results = cust_repo.find_by_first_name(input_name)
    assert_equal "Joey", results.first_name
  end

  def test_it_can_find_by_first_name_then_display_other_attributes_associated_with_first_name
    input_name = "Joey"
    results = cust_repo.find_by_first_name(input_name)
    assert_equal "1", results.id
    assert_equal "Ondricka", results.last_name
  end

  def test_it_can_find_a_differnt_customer_by_first_name
    input_name = "Leanne"
    results = cust_repo.find_by_first_name(input_name)
    assert_equal "Leanne", results.first_name
    assert_equal "4", results.id
  end

  def test_it_does_not_display_info_from_a_different_customer
    input_name = "Joey"
    results = cust_repo.find_by_first_name(input_name)
    refute_equal "Leanne", results.first_name
    refute_equal "4", results.id
  end

  def test_it_can_find_by_last_name
    input_name = "Ondricka"
    results = cust_repo.find_by_last_name(input_name)
    assert_equal "Ondricka", results.last_name
  end

  def test_it_can_find_by_last_name_then_display_other_attributes_associated_with_last_name
    input_name = "Ondricka"
    results = cust_repo.find_by_last_name(input_name)
    assert_equal "1", results.id
    assert_equal "Joey", results.first_name
  end

  def test_it_can_find_a_differnt_customer_by_last_name
    input_name = "Braun"
    results = cust_repo.find_by_last_name(input_name)
    assert_equal "Braun", results.last_name
    assert_equal "4", results.id
  end


    
end