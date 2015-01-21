require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoices'
require 'pry'
require 'csv'


class InvoicesTest < Minitest::Test
  attr_reader :invoices

  def setup
    @invoices = Invoices.new("1","Paul", "09/20", "09/21")
  end



  1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC
