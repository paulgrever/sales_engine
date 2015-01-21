require 'csv'

class Items
  attr_reader :id, :name, :description, :unit_price,
              :merchant_id,:created_at, :updated_at
  def initialize(id, name, descrption, unit_price, merchant_id, created_at, updated_at)
    @name = name
    @description = description
    @unit_price = unit_price
    @merchant_id = merchant_id
    @created_at = created_at
    @updated_at = updated_at
  end


end

# id,name,description,unit_price,merchant_id,created_at,updated_at
# 1,Item Qui Esse,Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
