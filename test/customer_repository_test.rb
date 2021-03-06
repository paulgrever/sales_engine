require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'
require './lib/sales_engine'
require 'csv'
require 'pry'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :cust_repo, :cust_repo_double
  def setup 
    filename = "test/fixtures/customers.csv"
    #uniq data
    filename2 = "test/fixtures/double_customers.csv"
    #data with double first names
    parent_engine = SalesEngine.new
    @cust_repo = CustomerRepository.new(filename, parent_engine)
    @cust_repo_double = CustomerRepository.new(filename2, parent_engine)
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
    assert_equal 3, results[2].id
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
    assert_equal 1, results.id
    assert_equal "Ondricka", results.last_name
  end

  def test_it_can_find_a_differnt_customer_by_first_name
    input_name = "Leanne"
    results = cust_repo.find_by_first_name(input_name)
    assert_equal "Leanne", results.first_name
    assert_equal 4, results.id
  end

  def test_it_does_not_display_info_from_a_different_customer
    input_name = "Joey"
    results = cust_repo.find_by_first_name(input_name)
    refute_equal "Leanne", results.first_name
    refute_equal 4, results.id
  end

  def test_it_can_find_by_last_name
    input_name = "Ondricka"
    results = cust_repo.find_by_last_name(input_name)
    assert_equal "Ondricka", results.last_name
  end

  def test_it_can_find_by_last_name_then_display_other_attributes_associated_with_last_name
    input_name = "Ondricka"
    results = cust_repo.find_by_last_name(input_name)
    assert_equal 1, results.id
    assert_equal "Joey", results.first_name
  end

  def test_it_can_find_a_differnt_customer_by_last_name
    input_name = "Braun"
    results = cust_repo_double.find_by_last_name(input_name)
    assert_equal "Braun", results.last_name
    assert_equal 4, results.id
  end

  def test_it_can_locate_a_customer_by_id
    input_id = 5
    results = cust_repo.find_by_id(input_id)
    assert_equal "Sylvester", results.first_name
  end

  def test_it_can_locate_a_differnt_customer_by_id
    input_id = 4
    results = cust_repo.find_by_id(input_id)
    assert_equal "Braun", results.last_name
  end

  def test_it_can_find_all_customers_by_first_name
    input_name = "Leanne"
    results = cust_repo_double.find_all_by_first_name(input_name)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_customers_by_first_name
    input_name = "Joey"
    results = cust_repo_double.find_all_by_first_name(input_name)
    assert_equal 2, results.count
  end

  def test_it_can_find_all_customers_by_last_name
    input_name = "Braun"
    results = cust_repo_double.find_all_by_last_name(input_name)
    assert_equal 2, results.count
  end

  def test_it_can_find_all_customers_by_id
    input_id = 6
    results = cust_repo_double.find_all_by_id(input_id)
    assert_equal 1, results.count
  end

  def test_it_doesnt_find_all_if_it_dont_exist
    input_id = 10
    results = cust_repo_double.find_all_by_id(input_id)
    assert_equal 0, results.count
  end

  def test_it_can_find_all_invoices_associated_with_a_customer
    input = 1
    results = cust_repo.invoices(input)
    assert_equal 4, results.size
  end


   
end