require_relative "invoices_parser"
require 'pry'
class InvoiceRepository
  attr_reader :parent_engine, :all_invoice_list

  def initialize(filename, parent_engine)
    @all_invoice_list = InvoicesParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def invoices
    all_invoice_list.parse
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(input_id)
    invoices.find {|invoice| invoice.id == input_id }
  end

  def find_by_customer_id(input_id)
    invoices.find {|invoice| invoice.customer_id == input_id }
  end

  def find_by_merchant_id(input_id)
    invoices.find {|invoice| invoice.merchant_id == input_id }
  end

  def find_by_status(input_status)
    invoices.find {|invoice| invoice.status== input_status }
  end

  def find_by_created_at(input_created_date)
    invoices.find {|invoice| invoice.created_at == input_created_date}
  end

  def find_by_updated_at(input_updated_date)
    invoices.find {|invoice| invoice.updated_at == input_updated_date}
  end

  def find_all_by_id(input_id)
    invoices.find_all {|invoice| invoice.id == input_id }
  end

  def find_all_by_customer_id(input_id)
    invoices.find_all {|invoice| invoice.customer_id == input_id }
  end

  def find_all_by_merchant_id(input_id)
    invoices.find_all {|invoice| invoice.merchant_id == input_id }
  end

  def find_all_by_status(input_status)
    invoices.find_all {|invoice| invoice.status == input_status }
  end

  def find_all_by_created_at(input_created_date)
    invoices.find_all {|invoice| invoice.created_at == input_created_date}
  end

  def find_all_by_updated_at(input_updated_date)
    invoices.find_all {|invoice| invoice.updated_at == input_updated_date}
  end

  def transactions(input_invoice_id)
    parent_engine.transaction_repository.find_all_by_invoice_id(input_invoice_id)
  end

  def invoice_items(input_invoice_id)
    parent_engine.invoice_item_repository.find_all_by_invoice_id(input_invoice_id)
  end

  def customer(input_cust_id)
    parent_engine.customer_repository.find_by_id(input_cust_id)
  end

  def merchant(input_merch_id)
    parent_engine.merchant_repository.find_by_id(input_merch_id)
  end

  def successful_transaction
    parent_engine.transaction_repository.find_all_by_result("success")
  end

   



end

# id,customer_id,merchant_id,status,created_at,updated_at
