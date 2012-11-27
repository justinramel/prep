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

  def self.item(field)
    new(field)
  end

end
