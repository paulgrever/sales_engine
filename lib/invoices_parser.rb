require_relative 'invoices'
require 'pry'
require 'csv'

class InvoicesParser
  attr_reader :parse, :parent_klass

  def initialize(filename, parent_klass)
    @parse = create_invoices(filename, parent_klass)
  end

  def create_invoices(filename, parent_klass)
    invoices = CSV.open "#{filename}", headers: true, header_converters: :symbol
    invoices_arr = invoices.collect do |invoice|
      id          = invoice[:id].to_i
      customer_id = invoice[:customer_id].to_i
      merchant_id = invoice[:merchant_id].to_i
      status      = invoice[:status]
      created_at  = invoice[:created_at]
      updated_at  = invoice[:updated_at]
      Invoices.new(id, customer_id, merchant_id, status, created_at, updated_at, parent_klass)
    end
  end
end

  # parent_klass = "test"
  # filename = "./test/fixtures/invoices.csv"
  # test = InvoicesParser.new(filename, parent_klass)
  # puts test
