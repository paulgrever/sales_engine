require_relative 'sales_engine'
class Invoices
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :parent_engine

  def initialize(id, customer_id, merchant_id, status, created_at, updated_at, parent_engine)
    @id = id
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status = status
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def transactions
    parent_engine.transaction_repository.find_all_by_invoice_id(@id)
  end

  def invoice_items
    parent_engine.invoice_item_repository.find_all_by_invoice_id(@id)
  end

  def customer
    parent_engine.customer_repository.find_by_id(@customer_id)
  end

  def merchant
    parent_engine.merchant_repository.find_by_id(@merchant_id)
  end

  def items
    invoices = parent_engine.invoice_item_repository.find_all_by_invoice_id(@id)
    item_by_id = invoices.map(&:item_id)
    items_by_it = item_by_id.map{|id_of_item| parent_engine.item_repository.find_by_id(id_of_item)}
  end

  def successful_transactions
    parent_engine.transaction_repository.find_all_by_result("success")
  end

end
