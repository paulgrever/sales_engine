require 'csv'
require_relative 'items_parser'
require 'pry'

# id,name,description,unit_price,merchant_id,created_at,updated_at

class ItemsRepository

  attr_reader :parent_engine, :all_items_list

    def initialize(filename, parent_engine)
      @all_items_list = ItemsParser.new(filename, parent_engine)
      @parent_engine = parent_engine
    end

    def inspect
      "#<#{self.class} #{@merchants.size} rows>"
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

    def find_by_unit_price(input_unit_price)
      items.find { |item| item.unit_price == input_unit_price}
    end

    def find_by_merchant_id(input_merchant_id)
      items.find { |item| item.merchant_id == input_merchant_id}
    end

    def find_by_created_at(input_created_date)
      items.find { |item| item.created_at == input_created_date}
    end

    def find_by_updated_at(input_updated_date)
      items.find { |item| item.updated_at == input_updated_date}
    end

    def find_all_by_id(input_id)
      items.find_all { |item| item.id == input_id}
    end

    def find_all_by_name(input_name)
      items.find_all { |item| item.name.downcase == input_name.downcase}
    end

    def find_all_by_description(input_description)
      items.find_all { |item| item.description == input_description}
    end

    def find_all_by_unit_price(input_unit_price)
      items.find_all { |item| item.unit_price == input_unit_price}
    end

    def find_all_by_merchant_id(input_merchant_id)
      items.find_all { |item| item.merchant_id == input_merchant_id}
    end

    def find_all_by_created_at(input_created_date)
      items.find_all { |item| item.created_at == input_created_date}
    end

    def find_all_by_updated_at(input_updated_date)
      items.find_all { |item| item.updated_at == input_updated_date}
    end
end




