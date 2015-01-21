require './lib/customers'

class CustomersParser
  attr_reader :customer_file
  def initialize(filename)
    @customer_file = create_customers(filename)
  end
  def create_customers(filename)
      customers = CSV.open "#{filename}", headers: true, header_converters: :symbol
      customer_array = customers.map do |customer|
      id = customer[:id]
      first_name = customer[:first_name]
      last_name = customer[:last_name]
      created_at = customer[:created_at]
      updated_at = customer[:updated_at]
      Customers.new(id, first_name, last_name, created_at, updated_at)
    end
  end
end

filename = "./data/customers.csv"
test = CustomersParser.new(filename)
test.customer_file.each do |name|
  puts name.first_name
end
