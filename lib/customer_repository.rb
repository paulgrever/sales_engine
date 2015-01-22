
class CustomerRepository
  attr_reader :parent_class

  def initialize(filename)
    @customer_list = CustomersParser.new(filename, parent_class)
    @parent_class = parent_class
  end

  def init_parser(filename)
    CustomersParser.new(filename, self)
  end


end