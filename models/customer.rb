require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :fund

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @fund = options['fund'].to_i 
end

def save()
  sql = "INSERT INTO customers (name, fund) 
  VALUES ('#{ @name }', '#{ @fund}' ) 
  RETURNING id"
  customer = SqlRunner.run( sql).first
  @id = customer['id'].to_i
end

def film()
  sql = "SELECT films. * WHERE id = #{@film_id}"
  film = SqlRunner.run(sql).first()
  return Film.new(film)
end

def ticket()
  sql = "SELECT tickets. * WHERE id = #{@id}"
  ticket = SqlRunner.run(sql).first()
  return Ticket.new(ticket)
end

def update()

end
def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end
end