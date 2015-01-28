require_relative 'sales_engine'
class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :parent_engine

  def initialize(id, first_name, last_name, created_at, updated_at, parent_engine)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def invoices
    parent_engine.invoice_repository.find_all_by_customer_id(@id)
  end

end


# id,first_name,last_name,created_at,updated_at
# 1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
