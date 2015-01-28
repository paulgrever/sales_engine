require 'minitest/autorun'
require 'minitest/pride'
require './lib/items'
require 'csv'
require 'bigdecimal'


class ItemsTest < Minitest::Test
  attr_reader :items

  def setup
    @items = Items.new(1,"Item Qui Esse","Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.","75107", 1, "2012-03-27 14:53:59 UTC","2012-03-27 14:53:59 UTC", "parent")
  end

  def test_it_exists
    assert Items
  end

  def test_it_takes_id
    
    assert_equal 1, items.id
  end

  def test_it_takes_name
    
    assert_equal "Item Qui Esse", items.name
  end

  def test_it_takes_description
    
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", items.description
  end

  def test_it_takes_unit_price
    results = items.unit_price
    assert_equal 751.07, results.to_f
  end

  def test_it_takes_merchant_id
    
    assert_equal 1, items.merchant_id
  end

  def test_it_was_created_at_certain_date
    
    assert_equal "2012-03-27 14:53:59 UTC", items.created_at
  end

  def test_it_was_updated_at
    
    assert_equal "2012-03-27 14:53:59 UTC", items.updated_at
  end

end
