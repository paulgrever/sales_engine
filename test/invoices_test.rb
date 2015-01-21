require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoices'
require 'csv'


class InvoicesTest < Minitest::Test
  attr_reader :invoices

  def setup
    @invoices = Invoices.new("1", "1","26","shipped", "2012-03-25 09:54:09 UTC","2012-03-25 09:54:09 UTC")
  end

  def test_it_exists
    assert Invoices
  end

  def test_it_takes_id
    skip
    assert_equal "1", invoices.id
  end

  def test_it_takes_customer_id
    skip
    assert_equal "1", invoices.customer_id
  end

  def test_it_takes_merchant_id
    skip
    assert_equal "26", invoices.merchant_id
  end

  def test_it_takes_status
    skip
    assert_equal "shipped", invoices.status
  end

  def test_it_was_created_at_certain_date
    skip
    assert_equal "2012-03-25 09:54:09 UTC", invoices.created_at
  end

  def test_it_was_updated_at_certain_date
    skip
    assert_equal "2012-03-25 09:54:09 UTC", invoices.updated_at
  end


end
