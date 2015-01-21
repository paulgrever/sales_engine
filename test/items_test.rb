require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items'
require 'csv'


class ItemsTest < Minitest::Test
  attr_reader :items

end
#   def setup
#     @items = Items.new("")
#   end
#
#   def test_it_exists
#     assert Items
#   end
#
#   def test_it_takes_id
#     skip
#     assert_equal "1", items.id
#   end
#
#   def test_it_takes_name
#     skip
#     assert_equal "Item Qui Esse", items.name
#   end
#
#   def test_it_takes_description
#     skip
#     assert_equal "Nihil autem sit odio inventore deleniti",
#   end
#
#   def test_it_takes_unit_price
#     skip
#
#   end
#
#   def test_it_takes_merchant_id
#     skip
#     assert_equal "2012-03-27 14:53:59 UTC"
#   #id,name,description,unit_price,merchant_id,created_at,updated_at
#    "Est lae distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC"
#  end
# end
#
# @name = name
# @description = description
# @unit_price = unit_price
# @merchant_id = merchant_id
# @created_at = created_at
# @updated_at = updated_at
