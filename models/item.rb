
require_relative('../db/sql_runner')
require_relative('group')

class Item

  attr_reader :id, :name, :price, :group_id, :manufacturer_id, :sell_price, :quantity


  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @name = options['name']
    @price = options['price'].to_i
    @group_id = options['group_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @sell_price = options['sell_price'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO items
    (
    name,
    price,
    group_id,
    manufacturer_id,
    sell_price,
    quantity
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @price, @group_id, @manufacturer_id, @sell_price, @quantity]
    items_data = SqlRunner.run(sql, values)
    id = items_data.first()['id'].to_i
    @id = id
  end

  def manufacturer()
    manufacturer = Manufacturer.find(@manufacturer_id)
    return manufacturer
  end

  def group()
    group = Group.find(@group_id)
    return group
  end

  def self.map_items(item_data)
    return item_data.map { |item| Item.new(item) }
  end

  def self.all()
    sql = "SELECT * FROM items"
    item_data = SqlRunner.run(sql)
    items = map_items(item_data)
    return items
  end

  def self.find(id)
    sql = "SELECT * FROM items
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    item = Item.new(result)
    return item
  end

  def update()
    sql = "UPDATE items
    SET
    (
      name,
      price,
      group_id,
      manufacturer_id,
      sell_price,
      quantity
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @price, @group_id, @manufacturer_id, @sell_price, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM items
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM items"
    SqlRunner.run(sql)
  end

  def check_stock_lvl()
    if @quantity >= 40
      return "stock-green"
    elsif @quantity >= 20
      return "stock-orange"
    else
      return "stock-red"
    end
  end



  # def check_stock_lvl_as_text()
  #   if @quantity >= 40
  #     return "High Stock"
  #   elsif @quantity >= 20
  #     return "stock-orange"
  #   else
  #     return "stock-red"
  #   end
  # end
end
