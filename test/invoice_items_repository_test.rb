require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items_repository'
require 'csv'
require 'pry'

class InvoiceItemsRepositoryTest < Minitest::Test
  attr_reader :ii_repo
  def setup 
    filename = "test/fixtures/invoice_items_fixtures.csv"
    parent_engine = "parent"
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
    results = ii_repo.find_by_id("3")
    assert_equal "523", results.item_id
  end

  def test_it_can_find_by_an_item_id
    results = ii_repo.find_by_item_id("535")
    assert_equal "4", results.id
  end

  def test_it_can_find_by_an_invoice_id
    results = ii_repo.find_by_invoice_id("2")
    assert_equal "9", results.id
  end

  def test_it_can_find_by_quantity
    results = ii_repo.find_by_quantity("8")
    assert_equal "3", results.id
  end

  def test_it_can_find_by_unit_price
    results = ii_repo.find_by_unit_price("13635")
    assert_equal "539", results.item_id
  end

  def test_it_can_find_all_by_id
    results = ii_repo.find_all_by_id("3")
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_item_id
    results = ii_repo.find_all_by_item_id("535")
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_item_id_when_none
    results = ii_repo.find_all_by_item_id("462")
    assert_equal 0, results.count
  end

  def test_it_can_find_all_by_invoice_id
    results = ii_repo.find_all_by_invoice_id("2")
    assert_equal 3, results.count
  end

  def test_it_can_find_all_by_quantity
    results = ii_repo.find_all_by_quantity("3")
    assert_equal 2, results.count
  end

  def test_it_can_find_all_by_unit_price
    results = ii_repo.find_all_by_unit_price("23324")
    assert_equal 2, results.count
  end
end