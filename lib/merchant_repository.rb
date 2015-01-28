require 'csv'
require 'pry'
require_relative 'merchant_parser'
require_relative 'sales_engine'

class MerchantRepository
  attr_reader :parent_engine, :all_merchant_list

  def initialize(filename, parent_engine)
    @all_merchant_list = MerchantsParser.new(filename, parent_engine)
    @parent_engine = parent_engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_name(input_name)
    merchants.find {|merchant| merchant.name == input_name }
  end

  def find_by_id(input_id)
    merchants.find {|merchant| merchant.id == input_id }
  end

  def find_all_by_name(input_name)
    merchants.find_all {|merchant| merchant.name.downcase == input_name.downcase }
  end

  def find_all_by_id(input_id)
    merchants.find_all {|merchant| merchant.id == input_id}
  end

  def merchants
    all_merchant_list.parse
  end

  def items(merch_id)
    parent_engine.item_repository.find_all_by_merchant_id(merch_id)
  end

  def invoices(merch_id)
    parent_engine.invoice_repository.find_all_by_merchant_id(merch_id)
  end





end

