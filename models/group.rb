require_relative('../db/sql_runner')

class Group

attr_reader :id, :name

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
    return transaction


  def self.delete_all()
    sql = "DELETE FROM groups"
    SqlRunner.run(sql)
  end

end