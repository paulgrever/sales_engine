
class CustomerRepository

  def initialize(filename)
    @customer_list = CustomersParser.new(filename, self)
    @calling_object = calling_object
  end

  def init_parser(filename)
    CustomersParser.new(filename, self)
  end


end