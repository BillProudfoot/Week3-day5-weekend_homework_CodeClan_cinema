class Customer

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @fund = options['fund'].to_i 
end

end