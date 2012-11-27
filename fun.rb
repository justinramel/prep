def do_something(&block)
  block
end

item = do_something {p 'hello'}
p item



