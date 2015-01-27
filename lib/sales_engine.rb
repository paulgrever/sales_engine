require_relative 'customer_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'
require_relative 'items_repository'
require_relative 'invoice_items_repository'
require_relative 'invoice_repository'
require 'pry'

class SalesEngine
  attr_accessor :customer_repo, :merchant_repo, :item_repo, :invoice_item_repo, :invoice_repo, :transaction_repo

  def initialize
    #test_data
    @customer_repo = CustomerRepository.new('./test/fixtures/customers_fixtures.csv', self)
    @merchant_repo = MerchantRepository.new('./test/fixtures/merchants_fixtures.csv', self)
    @item_repo = ItemsRepository.new('./test/fixtures/items_fixtures.csv', self)
    @invoice_item_repo = InvoiceItemsRepository.new('./test/fixtures/invoice_items_fixtures.csv', self)
    @invoice_repo = InvoiceRepository.new('./test/fixtures/invoices_fixtures.csv', self)
    @transaction_repo = TransactionRepository.new('./test/fixtures/transactions_fixtures.csv', self)
    # @customer_repo = CustomerRepository.new('./data/customers.csv', self)
    # @merchant_repo = MerchantRepository.new('./data/merchants.csv', self)
    # @item_repo = ItemsRepository.new('./data/items.csv', self)
    # @invoice_item_repo = InvoiceItemsRepository.new('./data/invoice_items.csv', self)
    # @invoice_repo = InvoiceRepository.new('./data/invoices.csv', self)
    # @transaction_repo = TransactionRepository.new('./data/transactions.csv', self)
  end



end

# sales = SalesEngine.new

# test = sales.customer_repo.find_by_id("1").id
# binding.pry
# puts test.id