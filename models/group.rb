
require_relative('../db/sql_runner')

class Group

attr_reader :id, :name
attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO groups
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM groups
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    group = Group.new(result)
    return group
  end

  def self.all()
    sql = "SELECT * FROM groups"
    group_data = SqlRunner.run(sql)
    groups = map_items(group_data)
    return groups
  end

  def self.map_items(group_data)
    return group_data.map { |group| Group.new(group) }
  end

  def update()
    sql = "UPDATE groups
    SET
    (
      name,
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM groups
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM groups"
    SqlRunner.run(sql)
  end

end
