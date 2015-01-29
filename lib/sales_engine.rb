require_relative 'customer_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'
require_relative 'items_repository'
require_relative 'invoice_items_repository'
require_relative 'invoice_repository'
require 'pry'

class SalesEngine
  attr_reader :directory
  attr_accessor :customer_repository, :merchant_repository, :item_repository, :invoice_item_repository, :invoice_repository, :transaction_repository

  def initialize(directory = './test/fixtures')
    #test_data director = './test/fixtures'
    #real data directory = './data'
    @customer_repository = CustomerRepository.new(directory + '/customers.csv', self)
    @merchant_repository = MerchantRepository.new(directory + '/merchants.csv', self)
    @item_repository = ItemsRepository.new(directory + '/items.csv', self)
    @invoice_item_repository = InvoiceItemsRepository.new(directory + '/invoice_items.csv', self)
    @invoice_repository = InvoiceRepository.new(directory + '/invoices.csv', self)
    @transaction_repository = TransactionRepository.new(directory + '/transactions.csv', self)

  end

  def startup
  end
end
