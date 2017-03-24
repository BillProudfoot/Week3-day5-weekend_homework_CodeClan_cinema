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



end