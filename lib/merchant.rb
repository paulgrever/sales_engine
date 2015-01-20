require 'csv'

class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(id, name, created_at, updated_at)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
  end
end

# test = Merchant.new("3", "paul", "9/20", "9/21")
# puts test.name
