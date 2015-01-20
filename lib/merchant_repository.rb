class MerchantRepository
  attr_reader :entries

    def initialize
      merchant_repo = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
    end

  def all
    entries
  end

  def random
    entries.sample
  end

  def find_by_X(match) #"like Mary/mary but not mary ellen"
    entries.find_by
  end

  def find_all_by_X(match)

  end

  def items

  end

  def invoices

  end

  def most_revenue

  end

  def most_items

  end

  def revenue(date)

  end

end
