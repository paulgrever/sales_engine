require 'bigdecimal'

class InvoiceItems
  attr_reader :id, :item_id, :invoice_id, :quantity,
              :unit_price, :created_at, :updated_at, :parent_klass

  def initialize(id, item_id, invoice_id, quantity, unit_price, created_at, updated_at, parent_klass)
    @id = id
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = BigDecimal.new(unit_price)/100
    @created_at = created_at
    @updated_at = updated_at
    @parent_klass = parent_klass
  end

end
