require './lib/customers'
require 'pry'

class CustomersParser
  attr_reader :customer_file, :customer_arr, :parent_class
  def initialize(filename, parent_class)
    @customer_file = create_customers(filename, parent_class)
  end
  def create_customers(filename, parent_class)
      customers = CSV.open "#{filename}", headers: true, header_converters: :symbol
      @customer_array = customers.map do |customer|
      id = customer[:id]
      first_name = customer[:first_name]
      last_name = customer[:last_name]
      created_at = customer[:created_at]
      updated_at = customer[:updated_at]
      Customers.new(id, first_name, last_name, created_at, updated_at, parent_class)
    end
  end
end
parent_class = "test"
filename = "./data/customers.csv"
test = CustomersParser.new(filename, parent_class)
# test.customer_file.each do |name|
#   puts name.last_name
# end
puts test