def do_something(&block)
  block
end

def multiply(first,second)
  lambda{first * second}
end

def multiply_by_prime(prime)
end
class SomeBigItem
  
end

def expensive_creation
  lambda{
  p 'I am creating it again'
  SomeBigItem.new
  }
end

class Proc
  def yo
    p 'yo'
  end
end


factory = expensive_creation.memoize
3.times do
  factory.call
end
