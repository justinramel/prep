module Kernel
  def where(field)
    Where.new(field)
  end
end

class Where

  attr_reader :field, :value

  def initialize(field)
    @field = field
  end

  def equal_to(value)
    lambda { |item| item.send(field) == value }
  end

  def equal_to_any(*values)
    lambda { |item| values.each { |v| equal_to(v) } }
  end

  def not_equal_to(value)
    lambda { |item| item.send(field) != value }
  end

  def greater_than(value)
    lambda { |item| item.send(field) > value }
  end

  def between(min, max)
    lambda { |item| item.send(field) >= min && item.send(field) <= max }
  end

  def self.item(field)
    new(field)
  end

end
