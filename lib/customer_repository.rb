require_relative "customers_parser"
require 'pry'
class CustomerRepository
  attr_reader :parent_engine, :all_customer_list

  def initialize(filename, parent_engine)
    @all_customer_list = CustomersParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def all
    all_customer_list.parse
  end

  def random
    all_customer_list.parse.sample
  end



end

filename = "test/fixtures/customers_fixtures.csv"
test = CustomerRepository.new(filename, "test")

p test.random
p test.random
