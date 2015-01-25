require_relative "transactions_parser"
require 'pry'
class TransactionRepository
  attr_reader :parent_engine, :all_transaction_list

  def initialize(filename, parent_engine)
    @all_transaction_list = TransactionsParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def transactions
    all_transaction_list.parse
  end

  def all
    transactions 
  end

  def random
    transactions.sample
  end

  def find_by_id(input_id)
    transactions.find {|transaction| transaction.id == input_id }
  end

  def find_by_invoice_id(input_invoice_id)
    transactions.find {|transaction| transaction.invoice_id == input_invoice_id}
  end

  def find_by_credit_card_number(input_credit_card)
    transactions.find {|transaction| transaction.credit_card_number == input_credit_card}
  end

  def find_by_results(input_results)
    transactions.find {|transaction| transaction.result == input_results}
  end


  def find_by_created_at(input_created_date)
    transactions.find {|transaction| transaction.created_at == input_created_date}
  end

  def find_by_updated_at(input_updated_date)
    transactions.find {|transaction| transaction.updated_at == input_updated_date}
  end

  def find_all_by_id(input_id)
    transactions.find_all {|transaction| transaction.id == input_id }
  end  

  def find_all_by_invoice_id(input_invoice_id)
    transactions.find_all {|transaction| transaction.invoice_id == input_invoice_id}
  end

  def find_all_by_credit_card_number(input_credit_card)
    transactions.find_all {|transaction| transaction.credit_card_number == input_credit_card}
  end

  def find_all_by_created_at(input_created_date)
    transactions.find_all {|transaction| transaction.created_at == input_created_date}
  end

  def find_all_by_updated_at(input_updated_date)
    transactions.find_all {|transaction| transaction.updated_at == input_updated_date}
  end

  def find_all_by_results(input_results)
    transactions.find_all {|transaction| transaction.result == input_results}
  end
end

# id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at
