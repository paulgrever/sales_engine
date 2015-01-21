require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require 'csv'


class MerchantTest < Minitest::Test
  attr_reader :merchant
  
