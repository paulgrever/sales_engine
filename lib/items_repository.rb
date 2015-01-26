require 'csv'
require './lib/items_parser'
require 'pry'

class ItemsRepository

  attr_reader :parent_engine, :all_items_list

    def initialize(filename, parent_engine)
      @all_items_list = ItemsParser.new(filename, parent_engine)
      @parent_engine = parent_engine
    end

    def all
      items
    end

    def random
      items.sample
    end

    def find_by_id(input_id)
      items.find_all { |item| item.id == input_id }
    end

    def find_by_name(input_name)
      items.find { |item| item.name.downcase == input_name.downcase }
    end

    def find_by_description(input_description)
      items.find { |item| item.description.downcase == item.description.downcase}
    end

    def find_by_unit_price(input_unit_price)
      items.find { |item| item.unit_price == item.unit_price }
    end

    def find_by_merchant_id(input_merchant_id)
        items.find { |item| item.merchant_id == item.merchant_id }
    end

    def find_by_created_at(input_created_at)
      items.find { |item| item.created_at == item.created_at }
    end

    def find_by_updated_at(input_updated_at)
      items.find { |item| item.updated_at == item.updated_at }
    end

    def find_all_by_id(input_id)
      items.find_all { |item| item.id == input_id }
    end

    def find_all_by_name(input_name)
      items.find_all { |item| item.name.downcase == input_name.downcase }
    end

    def find_all_by_description(input_description)
      items.find_all { |item| item.description.downcase == item.description.downcase}
    end

    def find_all_by_unit_price(input_unit_price)
      items.find_all { |item| item.unit_price == item.unit_price }
    end

    def find_all_by_merchant_id(input_merchant_id)
      items.find_all { |item| item.merchant_id == item.merchant_id }
    end

    def find_all_by_created_at(input_created_at)
      items.find_all { |item| item.created_at == item.created_at }
    end

    def find_all_by_updated_at(input_updated_at)
      items.find_all { |item| item.updated_at == item.updated_at }
    end

    def items
      all_items_list
    end
end
