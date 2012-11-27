def do_something(&block)
  block
end

def multiply(first,second)
  lambda{first * second}
end

def multiply_by_prime(prime)
  lambda{|number| multiply(prime, number)}
end

times_2 = multiply_by_prime(2)
two_by_3 = times_2.call(3)
p two_by_3.call
