require 'minitest/autorun'
require 'minitest/pride'
require './lib/transactions'
require 'csv'


class TransactionsTest < Minitest::Test
  attr_reader :transactions

  def setup
    @transactions = Transactions.new("1","1", "654405418249632", nil,"success","2012-03-27 14:54:09 UTC","2012-03-27 14:54:09 UTC")
  end

  def test_it_exists
    assert Transactions
  end

  def test_it_takes_id
    #skip
    assert_equal "1", transactions.id
  end

  def test_it_takes_invoice_id
    #skip
    assert_equal "1", transactions.invoice_id
  end

  def test_it_takes_credit_card_number
    #skip
    assert_equal "654405418249632", transactions.credit_card_number
  end

  def test_it_takes_result
    #skip
    assert_equal "success", transactions.result
  end

  def test_it_was_created_at_certain_date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", transactions.created_at
  end

  def test_it_was_updated_at_certain_date
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", transactions.updated_at
  end

end
