require 'csv'
class Transactions
  attr_reader :id, :invoice_id, :credit_card_number,
              :credit_card_expiration_date, :result,
              :created_at, :updated_at
  def initialize(id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at)
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
  end


end

# id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at
# 1,1,4654405418249632,,success,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
