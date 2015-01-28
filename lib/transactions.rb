require 'csv'
require_relative 'sales_engine'
class Transactions
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result,
              :created_at, :updated_at, :parent_engine
  def initialize(id, invoice_id, credit_card_number, credit_card_expiration_date = "filLer", result, created_at, updated_at, parent_engine)
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
    @parent_engine = parent_engine
  end

  def invoice
    parent_engine.invoice_repository.find_by_id(@invoice_id)
  end
end
