require './lib/transactions'
require 'pry'
require 'csv'

class TransactionsParser
  attr_reader :transaction_file, :customer_arr, :parent_klass

  def initialize(filename, parent_klass)
    @transaction_file = create_transactions(filename, parent_klass)
  end

  def create_transactions(filename, parent_klass)
    transactions = CSV.open "#{filename}", headers: true, header_converters: :symbol
    @transaction_arr = transactions.collect do |transaction|
      id = transaction[:id]
      invoice_id = transaction[:invoice_id]
      credit_card_number = transaction[:credit_card_number]
      credit_card_expiration_date = transaction[:credit_card_expiration_date]
      result = transaction[:result]
      created_at = transaction[:created_at]
      updated_at = transaction[:updated_at]
      Transactions.new(id,invoice_id,credit_card_number, credit_card_expiration_date, result, created_at, updated_at)
    end
  end
end
  parent_klass = "test"
  filename = "./test/fixtures/transactions_fixtures.csv"
  test =TransactionsParser.new(filename, parent_klass)
  puts test

  #shorten to cc_num/cc_num_exp_date

  # CSV.open('newfile.csv', 'w') do |csv|
  #   csv << ["a string", "another string"]
  # end
