require_relative "customers_parser"
require 'pry'
class CustomerRepository
  attr_reader :parent_engine, :all_customer_list

  def initialize(filename, parent_engine)
    @all_customer_list = CustomersParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_first_name(input_name)
    customers.find {|customer| customer.first_name == input_name }
  end

  def find_by_last_name(input_name)
    customers.find {|customer| customer.last_name == input_name }
  end

  def find_by_id(input_id)
    customers.find {|customer| customer.id == input_id }
  end

  def find_all_by_first_name(input_name)
    customers.find_all {|customer| customer.first_name == input_name }
  end

  def find_all_by_last_name(input_name)
    customers.find_all {|customer| customer.last_name == input_name }
  end

  def find_all_by_id(input_id)
    customers.find_all {|customer| customer.id == input_id }
  end

  def customers
    all_customer_list.parse
  end

end

# filename = "test/fixtures/customers_fixtures.csv"
# test = CustomerRepository.new(filename, "test")
# custom = test.customers


# binding.pry
# p custom
