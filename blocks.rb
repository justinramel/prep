def do_something(&block)
  block
end

def multiply(first,second)
  lambda{first * second}
end

def multiply_by_prime(prime)
  lambda { |number| multiply(number, prime) }
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

  def memoize
    lambda { @result ||= call }
  end

end


module MessageGenerator
  def hello
    p 'Hi There'
    super
  end
end

class SomeItem
  def hello
    p 'Hello'
  end
end

class SomeItem
  old_hello = instance_method(:hello)

  define_method(:hello) do
    old_hello.bind(self).call
    p 'Metaprogramming is the bomb'
  end
end

item = SomeItem.new
# item.send(:extend,MessageGenerator)
item.hello


