require 'minitest/autorun'
require 'minitest/pride'
require './lib/items_repository'
require 'csv'
require 'pry'

class ItemsRepositoryTest < Minitest::Test
  attr_reader :items_repo

  def setup
    filename ="test/fixtures/items_fixtures.csv"
    parent_engine = "parent"
    @items_repo =ItemsRepository.new(filename,parent_engine)
  end

  def test_it_exists
    assert ItemsRepository
  end

  def test_it_holds_all_items_objects
    skip
    results = items_repo.all
    assert_equal 5, results.count
  end

  def test_it_holds_first_items_object
    results = items_repo.first
    assert_equal "Item Qui Esse", results.first.name
  end

  def test_it_holds_valid_last_items_object

    results = items_repo.last
    assert_equal "5", results[4].id
    assert_equal "Item Expedita Aliquam", results.last.name
  end

  def test_does_not_contain_data_not_in_fixture
    skip
    results = items_repo.all
    refute results.include?("Mithrandir")
  end

  def test_random_does_not_repeat_itself_often
    skip
    results = items_repo.shuffle.sample
    results2 = items_repo.shuffle.sample
    assert_equal false, results == results2
  end

  def test_it_can_find_by_second_name
    skip
    input_name = "Item Autem Minima"
    results = items_repo.find_by_name(input_name)
    assert_equal "Item Autem Minima", results.name
  end

  def test_it_can_display_other_attributes_of_second_name
    skip
    input_name = "Item Autem Minima"
    results = items.repo.find_by_name(input_name)
    assert_equal "2", results.id
    assert_equal "4291", results.unit_price
  end

  def test_it_can_find_item_by_merchant_id
    skip
    input_name = "Item Nemo Facere"
    results = items_repo.find_by_merchant_id(input_merchant_id)
    assert_equal 1, results.merchant_id
  end

  def test_it_can_find_item_by_updated_at
    skip
    input_updated_at = "2012-03-27 14:53:59 UTC"
    results = items_repo.find_by_updated_at(input_updated_at)
    assert_equal "2012-03-27 14:53:59 UTC", results.updated_at
  end

  def test_it_can_find_item_by_unit_price
    skip
    input_unit_price = "68723"
    results = items_repo.find_by_unit_price(input_unit_price)
    assert_equal
  end

  def test_it_can_find_all_items_by_name
    skip
    input_name = "Item Expedita Aliquam"
    results = items_repo.find_all_by_name(input_name)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_items_by_id
    skip
    input_id = "2"
    results = items_repo.find_all_by_id(input_id)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_items_by_merchant_id
    skip
    input_merchant_id = "1"
    results = items_repo.find_all_by_merchant_id(input_merchant_id)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_items_by_unit_price
    skip
    input_unit_price = "67076"
    results = items_repo.find_all_by_unit_price(input_unit_price)
    assert_equal 1, results.count
  end

  def test_it_can_find_all_items_by_created_at
    skip
    input_created_at = "2012-03-27 14:53:59 UTC"
    results = items_repo.find_all_by_created_at(input_created_at)
    assert_equal 5, results.count
    #note that all dates are the same exact date
  end

  def test_it_can_find_all_items_by_updated_at
    skip
    input_updated_at = "2012-03-27 14:53:59 UTC"
    results = items_repo.find_all_by_updated_at(input_updated_at)
    assert_equal 5, results.count
    #keep in mind above note on line 106
  end
end
