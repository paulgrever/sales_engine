require 'minitest/autorun'
require 'minitest/pride'
require './lib/items_repository'
require './lib/sales_engine'
require 'csv'
require 'pry'
require 'bigdecimal'

class ItemsRepositoryTest < Minitest::Test
  attr_reader :items_repo

  def setup
    filename ="test/fixtures/items.csv"
    parent_engine = SalesEngine.new
    @items_repo = ItemsRepository.new(filename,parent_engine)
  end

  def test_it_exists
    assert ItemsRepository
  end

  def test_it_holds_all_items_objects
    results = items_repo.all
    assert_equal 5, results.count
  end

  def test_it_can_find_by_id
    input_id = 1
    results = items_repo.find_by_id(input_id)
    assert_equal 1, results.merchant_id
  end

  def test_it_can_find_by_name
    results = items_repo.find_by_name("Item Qui Esse")
    assert_equal 1, results.id
  end

  def test_it_can_find_by_description
    results = items_repo.find_by_description("Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.")
    assert_equal "Item Autem Minima", results.name
  end

  def test_it_can_find_by_unit_price
    results = items_repo.find_by_unit_price(BigDecimal.new("32301"))
    assert_equal 3, results.id
  end

  def test_it_can_find_by_merchant_id
    results = items_repo.find_by_merchant_id(1)
    results2 = results.unit_price
    assert_equal BigDecimal.new("75107"), results2
  end

  def test_it_can_find_by_created_at
    results = items_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal BigDecimal.new("75107"), results.unit_price
  end

  def test_it_can_find_all_merchant_id
    results = items_repo.find_all_by_merchant_id(1)
    assert_equal 5, results.count
  end

  def test_it_can_find_all_item_name
    results = items_repo.find_all_by_name("Item Autem Minima")
    assert_equal 1, results.count
  end

  def test_it_can_find_invoice_items
    results = items_repo.invoice_items(539)
    assert_equal 2, results.count
    assert_equal 5, results[0].quantity
  end

  def test_it_can_find_merchants_associated_with_items
    results = items_repo.merchant(1)
    assert_equal "Schroeder-Jerde", results.name
  end









end