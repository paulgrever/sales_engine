require_relative 'sales_engine'

class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :parent_engine

  def initialize(id, first_name, last_name, created_at, updated_at, parent_engine)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def invoices
    parent_engine.invoice_repository.find_all_by_customer_id(@id)
  end

  def transactions
    invoices.map do |invoice_id|
      parent_engine.transaction_repository.find_all_by_invoice_id(@id)
    end
  end

  def invo_by_cus
    cust_invo = parent_engine.invoice_repository.find_all_by_customer_id(@id)
    succ_trans_by_cus = cust_invo.select do |cust_invo|
      binding.pry
      parent_engine.transaction_repository.find_all_by_invoice_id(cust_invo.id)
    end

  end



  # def successful_transactions_by_invoice_id
  #   arr_of_success = parent_engine.transaction_repository.find_all_by_result("success")
  #   test = arr_of_success.group_by do |transaction|
  #     transaction.invoice_id
  #   end
  #   binding.pry
  # end


  # def invo_group_by_succ
  #   invoices.group_by do |invoice|
  #     parent_engine.transaction_repository.




  # def favorite_merchant
  #   invoices
    
  # end
  #   successful = parent_engine.invoice_repository.successful_transactions
  #   successful.max_by
  # end

end


# id,first_name,last_name,created_at,updated_at
# 1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
