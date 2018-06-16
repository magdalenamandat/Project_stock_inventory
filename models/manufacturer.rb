require_relative('../db/sql_runner')

class Manufacturer

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email_address = options['email_address']
  end
end
