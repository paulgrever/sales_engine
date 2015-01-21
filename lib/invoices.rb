require 'csv'

class Invoices
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(id, customer_id, merchant_id, status, created_at, updated_at)
    @id = id
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status = status
    @created_at = created_at
    @updated_at = updated_at
  end

end

# id,customer_id,merchant_id,status,created_at,updated_at
#1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC
