class Where
  include Matcher

  attr_reader :field, :value

  def initialize(field)
    @field = field
  end

  def is_equal_to(value)
    @value = value
    self
  end

  def matches(item)
    item.send(field) == value
  end

  def self.item(field)
    new(field)
  end

end
