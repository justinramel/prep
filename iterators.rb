class MyCustomNameEnumerator
  def initialize(*names)
    @names = names
    @current_name_index = 0
  end

  def next
    raise StopIteration if @current_name_index == @names.count

    value = @names[@current_name_index]
    @current_name_index += 1
    value
  end
end


iterator = MyCustomNameEnumerator.new('JP','Justin','Mo')

loop{ p iterator.next }


numbers = Enumerator.new do|yielder|
  number = 1
  loop do
    yielder.yield number
    number += 1
  end
end

numbers.deferred_select{|item| item < 10}.take(5)

