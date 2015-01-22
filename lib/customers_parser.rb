require './lib/customers'
require 'pry'

class CustomersParser
  attr_reader :customer_list, :parent_class

  def initialize(filename, parent_class)
    @customer_list = create_customers(filename, parent_class)
  end

  def create_customers(filename, parent_class)
    customers = CSV.open "#{filename}", headers: true, header_converters: :symbol
    customer_array = customers.map do |customer|
      id = customer[:id]
      first_name = customer[:first_name]
      last_name = customer[:last_name]
      created_at = customer[:created_at]
      updated_at = customer[:updated_at]
      Customers.new(id, first_name, last_name, created_at, updated_at, parent_class)
    end
  end
end

# module Parser

#   def parse(filename, class_name)
#     object_list_csv = CSV.open "#{filename}", headers: true, header_converters: :symbol
#     headers = object_list_csv.headers #=> [:id, :first_name, :last_name, :created_at, :updated_at]
#     object_array = object_list_csv.map do |obj|
#       arr = headers.map do |header|
#         obj[header]
#       end
#       class_name.new(arr)
#     end
#   end

# end
# parent_class = "test"
# filename = "./data/customers.csv"
# test = CustomersParser.new(filename, parent_class)
# # test.customer_file.each do |name|
# #   puts name.last_name
# # end
# puts test