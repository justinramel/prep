class Enumerator
  def deferred_select(&condition)
    Enumerator.new do |yielder|
      self.each do|value|
        yielder.yield value if condition.call(value)
      end
    end
  end
end

numbers = Enumerator.new do|yielder|
  number = 1
  loop do
    yielder.yield number
    number += 1
  end
end

p numbers.deferred_select{|item| item < 10}.take(5)

