require_relative('../db/sql_runner')
require_relative('item')

class Shop

attr_accessor :items

  def initialize(items)
    @items = items
  end

def single_item_profit
  profit = @item.sell_price - @item.price
  return profit

end

  def stock_value
      total = 0
      for item in @items
        total += item.price
      end
      return total
  end



end
