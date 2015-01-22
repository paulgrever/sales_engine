
class CustomerRepository
  attr_reader :parent_engine, :customer_list

  def initialize(filename, parent_engine)
    @customer_list = CustomersParser.new(filename, parent_class).customer_list
    @parent_engine = parent_engine
  end



end