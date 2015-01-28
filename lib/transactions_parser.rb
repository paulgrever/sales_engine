require_relative 'transactions'
require 'pry'
require 'csv'

class TransactionsParser
  attr_reader :parse,  :parent_klass

  def initialize(filename, parent_klass)
    @parse = create_transactions(filename, parent_klass)
  end

  def create_transactions(filename, parent_klass)
    transactions = CSV.open "#{filename}", headers: true, header_converters: :symbol
    transaction_arr = transactions.map do |transaction|
      id = transaction[:id].to_i
      invoice_id = transaction[:invoice_id].to_i
      credit_card_number = transaction[:credit_card_number]
      credit_card_expiration_date = transaction[:credit_card_expiration_date]
      result = transaction[:result]
      created_at = transaction[:created_at]
      updated_at = transaction[:updated_at]
      Transactions.new(id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at, parent_klass)
    end
  end
end
  # parent_klass = "test"
  # filename = "./test/fixtures/transactions.csv"
  # test =TransactionsParser.new(filename, parent_klass)
  # puts test

  #shorten to cc_num/cc_num_exp_date

  # CSV.open('newfile.csv', 'w') do |csv|
  #   csv << ["a string", "another string"]
  # end
