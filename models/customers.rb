class Customer

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @funds = options['funds'].to_i 
end

end