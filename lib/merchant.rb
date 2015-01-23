require 'csv'

class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :parent_class

  def initialize(id, name, created_at, updated_at, parent_class)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @parent_class = parent_class
  end
end

# test = Merchants.new("3", "paul", "9/20", "9/21")
# puts test.name
