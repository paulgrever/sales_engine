require_relative 'invoice_items'
require 'pry'
require 'csv'

class InvoiceItemsParser
  attr_reader :parse, :parent_klass

  def initialize(filename, parent_klass)
    @parse = create_invoice_items(filename, parent_klass)
  end

  def create_invoice_items(filename, parent_klass)
    invoice_items = CSV.open "#{filename}", headers: true, header_converters: :symbol
    invoice_items_arr = invoice_items.map do |invoice_item|
        id         = invoice_item[:id].to_i
        item_id    = invoice_item[:item_id].to_i
        invoice_id = invoice_item[:invoice_id].to_i
        quantity   = invoice_item[:quantity].to_i
        unit_price = invoice_item[:unit_price].to_i
        created_at = invoice_item[:created_at]
        updated_at = invoice_item[:updated_at]
        InvoiceItems.new(id, item_id, invoice_id, quantity, unit_price, created_at, updated_at, parent_klass)
      end
    end
  end
