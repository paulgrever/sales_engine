require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items'
require 'csv'


class ItemsTest < Minitest::Test
  attr_reader :items
end
