
class Invoices
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :parent_klass

  def initialize(id, customer_id, merchant_id, status, created_at, updated_at, parent_klass)
    @id = id
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status = status
    @created_at = created_at
    @updated_at = updated_at
    @parent_klass = parent_klass
  end

end
