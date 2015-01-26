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
    input_id = "1"
    results = items_repo.find_by_id(input_id)
    assert_equal "1", results.merchant_id
  end

  def test_it_can_find_by_name
    results = items_repo.find_by_name("Item Qui Esse")
    assert_equal "1", results.id
  end

  def test_it_can_find_by_description
    results = items_repo.find_by_description("Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.")
    binding.pry
    assert_equal "Item Autem Minima", results.name
  end



end