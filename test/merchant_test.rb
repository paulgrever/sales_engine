require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require 'csv'


class MerchantTest < Minitest::Test

  def test_it_exists
    assert Merchant
  end

end