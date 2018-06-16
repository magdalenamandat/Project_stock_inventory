require_relative('../db/sql_runner')

class Item

  attr_accessor :name, :price, :group_id, :manufacturer_id, :profit, :sell_price, :quantity, :stock_level

  attr_reader :id

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @name = options['name']
    @price = options['price']
    @group_id = options['group_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @profit = options['profit']
    @sell_price = ['sell_price']
    @quantity = ['quantity']
    @stock_level = ['stock_level']
  end

  def save()
    sql = "INSERT INTO items
    (
    name,
    price,
    group_id,
    manufacturer_id,
    profit,
    sell_price,
    quantity,
    stock_level
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING *"
    values = [@name, @price, @group_id, @manufacturer_id, @profit, @sell_price, @quantity, @stock_level]
    items_data = SqlRunner.run(sql, values)
    id = items_data.first()['id'].to_i
    @id = id
  end


end
