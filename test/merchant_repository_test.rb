require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'
require 'csv'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repository, :merchant_repo

  def setup
    @merchant_repo = MerchantRepository.new
    @merchant_repository = merchant_repo.create_merchants
  end

  def test_it_exists
    assert MerchantRepository
  end

  def test_it_creates_an_object_for_each_merchant
    #there are 100 merchants in data file
    assert_equal 100, merchant_repository.size
  end

  #first data set is id = 1 name = Schroeder-Jerde
  #created = 2012-03-27 14:53:59 UTC updated = 2012-03-27 14:53:59 UTC

  def test_it_pulls_correct_data_from_merchant_1
    results = merchant_repository[0]
    assert_equal "1" , results.id
    assert_equal "Schroeder-Jerde", results.name
    assert_equal "2012-03-27 14:53:59 UTC", results.created_at
    assert_equal "2012-03-27 14:53:59 UTC", results.updated_at
  end

  def test_it_pulls_correct_data_from_merchant_15
    results = merchant_repository[14]
    assert_equal "15" , results.id
    assert_equal "Adams-Kovacek", results.name
    assert_equal "2012-03-27 14:54:00 UTC", results.created_at
    assert_equal "2012-03-27 14:54:00 UTC", results.updated_at
  end

  def test_it_can_display_all_merchants
    results = merchant_repo.all
    assert_equal 100, results.size
  end

  def test_it_includes_merchants_names
    results = merchant_repo.all
    results.include?("Zemlak")
    assert results
  end

  def test_it_includes_merchants_creates_times
    results = merchant_repo.all
    results.include?("2012-03-27 14:54:08 UTC")
    assert results
  end

  def test_it_creates_a_readable_out_put_with_all_valid_info
    results = merchant_repo.all
    results.include?("ID:85, Name:Sauer and Sons, Created Date:2012-03-27 14:54:07 UTC, Last Updated: 2012-03-27 14:54:07 UTC")
    assert results
  end

  def test_it_selects_a_random_merchant
    results1 = merchant_repo.random
    results2 = merchant_repo.random
    verify = results1 == results2
    refute verify
  end
end
