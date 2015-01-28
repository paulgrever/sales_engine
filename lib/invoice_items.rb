require 'bigdecimal'
require_relative 'sales_engine'

class InvoiceItems
  attr_reader :id, :item_id, :invoice_id, :quantity,
              :unit_price, :created_at, :updated_at, :parent_engine

  def initialize(id, item_id, invoice_id, quantity, unit_price, created_at, updated_at, parent_engine)
    @id = id
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = BigDecimal.new(unit_price)/100
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def invoice
    parent_engine.invoice_repository.find_by_id(@invoice_id)
  end

  def item
    parent_engine.item_repository.find_by_id(@item_id)
  end

end
