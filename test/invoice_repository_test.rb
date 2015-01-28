require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'
require './lib/sales_engine'

require 'pry'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :invoice_repo

  def setup
    filename = "test/fixtures/invoices.csv"
    parent_engine = SalesEngine.new
    @invoice_repo = InvoiceRepository.new(filename, parent_engine)
  end

  def test_it_exists
    assert InvoiceRepository
  end

  def test_it_displays_all_invoices
    results = invoice_repo.all
    assert_equal 7, results.count
  end

  def test_it_find_by_invoice_id
    results = invoice_repo.find_by_id(21)
    assert_equal 90, results.merchant_id
  end

  def test_it_find_by_customer_id
    results = invoice_repo.find_by_customer_id(1)
    assert_equal 26, results.merchant_id
  end

  def test_it_find_by_merchant_id
    results = invoice_repo.find_by_merchant_id(26)
    assert_equal 1, results.customer_id
  end

  def test_it_find_by_status
    results = invoice_repo.find_by_status("shipped")
    assert_equal 1, results.customer_id
  end

  def test_it_find_all_by_id
    results = invoice_repo.find_all_by_id(4)
    assert_equal 1, results.count
  end

  def test_it_find_all_by_customer_id
    results = invoice_repo.find_all_by_customer_id(1)
    assert_equal 4, results.count
  end

  def test_it_find_all_by_merchant_id
    results = invoice_repo.find_all_by_merchant_id(26)
    assert_equal 2, results.count
  end


def test_it_find_all_by_status
  results = invoice_repo.find_all_by_status("shipped")
  assert_equal 7, results.count
end

def test_it_finds_all_transactions_by_invoice_id
  results = invoice_repo.transactions(2)
  assert_equal 2, results.count
  assert_equal "4411510861233607", results[1].credit_card_number
end

def test_it_finds_all_invoice_items_by_invouce_id
  results = invoice_repo.invoice_items(2)
  assert_equal 3, results.count
end
def test_it_finds_all_invoice_items_by_invouce_id
  results = invoice_repo.invoice_items(1)
  assert_equal 5, results.count
  assert_equal 9, results[1].quantity
end

def test_it_finds_a_customer_by_invoice_id
  results = invoice_repo.customer(1)
  assert_equal "Joey", results.first_name
end

def test_it_finds_a_customer_by_invoice_id
  results = invoice_repo.merchant(2)
  assert_equal "Klein, Rempel and Jones", results.name
end





end
