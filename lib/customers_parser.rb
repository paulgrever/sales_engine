require_relative 'customer'
require 'pry'
require 'csv'

class CustomersParser
  attr_reader :parse, :parent_class

  def initialize(filename, parent_class)
    @parse = create_customers(filename, parent_class)
  end

  def create_customers(filename, parent_class)
    customers = CSV.open "#{filename}", headers: true, header_converters: :symbol
    customer_array = customers.map do |customer|
      id = customer[:id].to_i
      first_name = customer[:first_name]
      last_name = customer[:last_name]
      created_at = customer[:created_at]
      updated_at = customer[:updated_at]
      Customer.new(id, first_name, last_name, created_at, updated_at, parent_class)
    end
  end
end
