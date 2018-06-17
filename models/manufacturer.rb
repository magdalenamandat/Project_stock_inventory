require_relative('../db/sql_runner')

class Manufacturer

  attr_reader :id, :name, :email_address

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email_address = options['email_address']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      email_address
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @email_address]
    result = SqlRunner.run(sql,values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    manufacturer = House.new(result)
    return manufacturer
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturer_data = SqlRunner.run(sql)
    manufacturers = map_items(manufacturer_data)
    return manufacturers
  end

  def self.map_items(manufacturer_data)
    return manufacturer_data.map { |manufacturer| Manufacturer.new(manufacturer) }
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

end
