require './lib/invoice_items'
require 'pry'

class InvoiceItemsParser
  attr_reader :invoice_items_file, :invoice_items_arr, :parent_klass

  def initialize(filename, parent_klass)
    @invoice_items_file = create_invoice_items(filename, parent_klass)
  end

  def create_invoice_items(filename, parent_klass)
    invoice_items = CSV.open "#{filename}", headers: true, header_converters: :symbol
      @invoice_items_arr = invoice_items.collect do |invoice_item|
        id         = invoice_item[:id]
        item_id    = invoice_item[:item_id]
        invoice_id = invoice_item[:invoice_id]
        quantity   = invoice_item[:quantity]
        unit_price = invoice_item[:unit_price]
        created_at = invoice_items[:created_at]
        updated_at = invoice_items[:updated_at]
        InvoiceItems.new(id,item_id,invoice_id, quantity, unit_price, created_at, updated_at)
      end
    end
  end
  parent_klass = "test"
  filename ="./test/fixtures/invoice_items_fixtures.csv"
  test = InvoiceItemsParser.new(filename, parent_klass)

  puts test
