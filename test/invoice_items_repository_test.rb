require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository'
require './lib/sales_engine'

require 'csv'
require 'pry'

class InvoiceItemsRepositoryTest < Minitest::Test
  attr_reader :ii_repo
  def setup 
    filename = "test/fixtures/invoice_items.csv"
    parent_engine = SalesEngine.new
    @ii_repo = InvoiceItemsRepository.new(filename, parent_engine)
  end

  def test_it_exists
    assert InvoiceItemsRepository
  end

  def test_it_contains_all_invoice_items
    results = ii_repo.all
    assert_equal 8, results.count  
  end

  def test_it_can_find_by_an_id
    results = ii_repo.find_by_id(3)
    assert_equal 523, results.item_id
  end

  def test_it_can_find_by_an_item_id
    results = ii_repo.find_by_item_id(535)
    assert_equal 4, results.id
  end

  def test_it_can_find_by_an_invoice_id
    results = ii_repo.find_by_invoice_id(2)
    assert_equal 9, results.id
  end

  def test_it_can_find_by_quantity
    results = ii_repo.find_by_quantity(8)
    assert_equal 3, results.id
  end

  def test_it_can_find_by_unit_price
    results = ii_repo.find_by_unit_price(136.35)
    assert_equal 539, results.item_id
  end

  def test_it_can_find_all_by_id
    results = ii_repo.find_all_by_id(3)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_item_id
    results = ii_repo.find_all_by_item_id(535)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_item_id_when_none
    results = ii_repo.find_all_by_item_id(462)
    assert_equal 0, results.count
  end

  def test_it_can_find_all_by_invoice_id
    results = ii_repo.find_all_by_invoice_id(2)
    assert_equal 3, results.count
  end

  def test_it_can_find_all_by_quantity
    results = ii_repo.find_all_by_quantity(3)
    assert_equal 2, results.count
  end

  def test_it_can_find_all_by_unit_price
    results = ii_repo.find_all_by_unit_price(233.24)
    assert_equal 2, results.count
  end

  def test_it_can_search_invoices_by_invoice_id
    results = ii_repo.invoice(1)
    assert_equal "shipped", results.status

  end

  def test_it_can_search_items_through_invoice_id
    results = ii_repo.item(5)
    assert_equal "Item Expedita Aliquam", results.name
  end


end