require 'csv'
require './lib/items_parser'
require 'pry'

# id,name,description,unit_price,merchant_id,created_at,updated_at

class ItemsRepository

  attr_reader :parent_engine, :all_items_list

    def initialize(filename, parent_engine)
      @all_items_list = ItemsParser.new(filename, parent_engine)
      @parent_engine = parent_engine
    end

    def items
      all_items_list.parse
    end

    def all
      items
    end

    def random
      items.sample
    end

    def find_by_id(input_id)
      items.find { |item| item.id == input_id}
    end

    def find_by_name(input_name)
      items.find { |item| item.name == input_name}
    end

    def find_by_description(input_description)
      items.find { |item| item.description == input_description}
    end

    

end
