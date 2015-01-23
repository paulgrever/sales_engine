require 'csv'
class Transactions
  attr_reader :id, :invoice_id, :credit_card_number,
              :credit_card_expiration_date, :result,
              :created_at, :updated_at, :parent_klass
  def initialize(id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at, parent_klass)
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
    @parent_klass = parent_klass
  end
end
