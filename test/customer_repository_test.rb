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
    binding.pry
    assert 5, results.count
  end

end