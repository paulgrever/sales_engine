require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'
require 'pry'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :tran_repo, :tran_repo2
  def setup 
    filename = "test/fixtures/transactions_fixtures.csv"
    filename2 = "test/fixtures/double_transaction_fixtures.csv"

    parent_engine = "parent"
    @tran_repo = TransactionRepository.new(filename, parent_engine)
    @tran_repo2 = TransactionRepository.new(filename2, parent_engine)

  end

  def test_it_exists
    assert TransactionRepository
  end

  def test_it_displays_all_transactions
    results = tran_repo.all
    assert_equal 6, results.count
  end

  def test_it_can_find_a_transaction_by_id
    results = tran_repo.find_by_id("3")
    assert_equal "4354495077693036", results.credit_card_number
  end

  def test_it_can_find_a_transaction_by_invoice_id
    results = tran_repo.find_by_invoice_id("4")
    assert_equal "4354495077693036", results.credit_card_number
    assert_equal "3", results.id
  end

  def test_it_can_find_a_transaction_by_credit_card_number
    results = tran_repo.find_by_credit_card_number("4580251236515201")
    assert_equal "2", results.id
    assert_equal "2", results.invoice_id
  end

  def test_it_can_find_a_transaction_by_results
    results = tran_repo.find_by_results("success")
    assert_equal "1", results.id
  end

  def test_it_can_find_a_transaction_by_results
    results = tran_repo.find_by_results("failed")
    assert_equal "14", results.id
  end

  def test_it_can_find_all_with_id
    results = tran_repo.find_all_by_id("1")
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_invoice_id
    results = tran_repo.find_all_by_invoice_id("2")
    assert_equal 1, results.count
  end

  def test_it_can_find_all_by_invoice_id
    results = tran_repo2.find_all_by_invoice_id("6")
    assert_equal 2, results.count
  end

  def test_it_can_find_all_by_credit_card
    results = tran_repo2.find_all_by_credit_card_number("4354495077693036")
    assert_equal 2, results.count
  end

  def test_it_can_find_all_by_result
    results = tran_repo2.find_all_by_results("success")
    assert_equal 6, results.count
  end

  def test_it_can_find_all_by_result_failed
    results = tran_repo2.find_all_by_results("failed")
    assert_equal 1, results.count
  end



end