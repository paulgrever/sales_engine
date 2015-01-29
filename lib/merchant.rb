require 'csv'
require_relative 'sales_engine'

class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :parent_engine

  def initialize(id, name, created_at, updated_at, parent_engine)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def items
    parent_engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    parent_engine.invoice_repository.find_all_by_merchant_id(@id)
  end  
end

