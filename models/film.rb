require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) 
    VALUES ('#{ @title }', '#{ @price}' ) 
    RETURNING id"
    film = SqlRunner.run( sql).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    return self.get_many(sql)
  end

  def customer()
    sql = "SELECT customers.* WHERE id = #{@customer_id}"
    customer = SqlRunner.run(sql).first()
    return Customer.new(customer)
  end

  def customers()
    sql = " SELECT customers.* FROM customers
          INNER JOIN tickets ON tickets.customer_id = customers.id
          WHERE film_id = #{@id};"
    return Customer.get_many(sql)
  end


  def ticket()
    sql = "SELECT tickets. * WHERE id = #{@id}"
    ticket = SqlRunner.run(sql).first()
    return Ticket.new(ticket)
  end

  def update()
    sql =" UPDATE films
    SET (title, price) = ('#{@title}', #{@price})
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films where id =#{@id}"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end