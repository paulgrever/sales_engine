require 'minitest/autorun'
require 'minitest/pride'
require './lib/items'
require 'csv'


class ItemsTest < Minitest::Test
  attr_reader :items

  def setup
    @items = Items.new("1","Item Qui Esse","Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.","75107", "1", "2012-03-27 14:53:59 UTC","2012-03-27 14:53:59 UTC")
  end

  def test_it_exists
    assert Items
  end

  def test_it_takes_id
    #skip
    assert_equal "1", items.id
  end

  def test_it_takes_name
    #skip
    assert_equal "Item Qui Esse", items.name
  end

  def test_it_takes_description
    #skip
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", items.description
  end

  def test_it_takes_unit_price
    #skip
    assert_equal "75107", items.unit_price
  end

  def test_it_takes_merchant_id
    #skip
    assert_equal "1", items.merchant_id
  end

  def test_it_was_created_at_certain_date
    #skip
    assert_equal "2012-03-27 14:53:59 UTC", items.created_at
  end

  def test_it_was_updated_at
    #skip
    assert_equal "2012-03-27 14:53:59 UTC", items.updated_at
  end

end
