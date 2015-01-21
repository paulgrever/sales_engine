require 'csv'

class Customers
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(id, first_name, last_name, created_at, updated_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @created_at = created_at
    @updated_at = updated_at
  end

end






# id,first_name,last_name,created_at,updated_at
# 1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
