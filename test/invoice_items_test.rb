require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items'
require 'csv'

class InvoiceItemsTest < Minitest::Test
  attr_reader :invoice_items

  def setup
    @invoice_items = InvoiceItems.new("1","539","1","5","13635","2012-03-27 14:54:09 UTC", "2012-03-27 14:54:09 UTC", "parent_klass")
  end

  def test_it_exists
    assert InvoiceItems
  end

  def test_it_takes_id
    #skip
    assert_equal "1", invoice_items.id
  end

  def test_it_takes_item_id
    #skip
    assert_equal "539", invoice_items.item_id
  end

  def test_it_takes_invoice_id
    #skip
    assert_equal "1", invoice_items.invoice_id
  end

  def test_it_takes_quantity
    #skip
    assert_equal "5", invoice_items.quantity
  end

  def test_it_takes_unit_price
    #skip
    assert_equal "13635", invoice_items.unit_price
  end

  def test_it_was_created_at_certain_Date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.created_at
  end

  def test_it_was_updated_at_certain_date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.updated_at
  end


end
