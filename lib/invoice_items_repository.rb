require_relative "invoice_items_parser"
require 'pry'
class InvoiceItemsRepository
  attr_reader :parent_engine, :all_invoice_items_list

  def initialize(filename, parent_engine)
    @all_invoice_items_list = InvoiceItemsParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def invoice_items
    all_invoice_items_list.parse
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(input_id)
    invoice_items.find {|invoice_item| invoice_item.id == input_id}
  end

  def find_by_item_id(input_id)
    invoice_items.find {|invoice_item| invoice_item.item_id == input_id}
  end

  def find_by_invoice_id(input_id)
    invoice_items.find {|invoice_item| invoice_item.invoice_id == input_id}
  end

  def find_by_quantity(input_quantity)
    invoice_items.find {|invoice_item| invoice_item.quantity== input_quantity}
  end

  def find_by_unit_price(input_unit_price)
    invoice_items.find {|invoice_item| invoice_item.unit_price== input_unit_price}
  end

  def find_by_created_at(input_created_at)
    invoice_items.find {|invoice_item| invoice_item.created_at== input_created_at}
  end

  def find_by_updated_at(input_updated_at)
    invoice_items.find {|invoice_item| invoice_item.updated_at== input_updated_at}
  end

  def find_all_by_id(input_id)
    invoice_items.find_all {|invoice_item| invoice_item.id == input_id}
  end

  def find_all_by_item_id(input_id)
    invoice_items.find_all {|invoice_item| invoice_item.item_id == input_id}
  end

  def find_all_by_invoice_id(input_id)
    invoice_items.find_all {|invoice_item| invoice_item.invoice_id == input_id}
  end

  def find_all_by_quantity(input_quantity)
    invoice_items.find_all {|invoice_item| invoice_item.quantity== input_quantity}
  end

  def find_all_by_unit_price(input_unit_price)
    invoice_items.find_all {|invoice_item| invoice_item.unit_price== input_unit_price}
  end

  def find_all_by_created_at(input_created_at)
    invoice_items.find_all {|invoice_item| invoice_item.created_at== input_created_at}
  end

  def find_all_by_updated_at(input_updated_at)
    invoice_items.find_all {|invoice_item| invoice_item.updated_at== input_updated_at}
  end

end

